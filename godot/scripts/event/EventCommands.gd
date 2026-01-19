extends Node
class_name EventCommands

static func execute(command: Dictionary, runner: Node) -> void:
	var cmd_name = command.get("cmd", "")
	print("[EVT] Execute: ", cmd_name, " ", command)
	
	match cmd_name:
		"say":
			var text = command.get("text", "")
			# DialogUI interaction handled in EventRunner for blocking/awaiting
			# Here we just trigger the show
			var dialog_ui = runner.get_tree().get_first_node_in_group("ui_dialog")
			if dialog_ui and dialog_ui.has_method("show_text"):
				dialog_ui.call("show_text", text)
			else:
				printerr("[EVT] Error: DialogUI not found.")
				
		"add_money":
			var amount = command.get("amount", 0)
			GameState.add_money(amount)
			
		"set_flag":
			var key = command.get("key", "")
			var val = command.get("val", true)
			GameState.set_flag(key, val)
			
		"give_item":
			var item_id = command.get("id", "")
			var count = command.get("count", 1) # Support count if GS supports it, otherwise just add
			if item_id != "":
				# Loop for count or update GameState to support counts (S1 GS is array list)
				for i in range(count):
					GameState.add_item(item_id)
					
		"goto_scene":
			var scene_name = command.get("scene_name", "") # logical name or path?
			# Architecture says: scene_path. But JSON might use short name? 
			# Let's support direct path or mapping.
			# For PoC, let's assume valid resource path or simple mapping
			var path = ""
			if scene_name == "battle":
				path = "res://scenes/battle.tscn"
			elif scene_name == "town":
				path = "res://scenes/town.tscn"
			elif scene_name == "overworld":
				path = "res://scenes/overworld.tscn"
			else:
				path = scene_name # assume raw path
				
			SceneRouter.goto_scene(path)
			
		"start_battle":
			var enemy_id = command.get("enemy_group_id", "")
			print("[BATTLE] Request Start Battle: ", enemy_id)
			# In Gate L1, this will trigger actual battle scene with params
			SceneRouter.goto_scene("res://scenes/battle.tscn")
			
		"wait":
			# Handled in Runner for blocking
			pass
			
		_:
			printerr("[EVT] Unknown command: ", cmd_name)
