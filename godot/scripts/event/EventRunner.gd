extends Node
class_name EventRunner

# Simple runner for PoC
# Execute a list of commands

func run_event_blocks(event_blocks: Array) -> void:
	# Iterate through blocks, check condition, run first valid one
	var ran_any = false
	
	for block in event_blocks:
		var conditions = block.get("condition", {})
		if EventConditions.check(conditions):
			print("[EVT] Conditions met for block. Executing...")
			var commands = block.get("commands", [])
			await run_commands(commands)
			ran_any = true
			break # Only run the first valid block (common RPG pattern)
	
	if not ran_any:
		print("[EVT] No event block conditions met.")

# Renamed from run_event to run_commands for clarity, but supporting old signature if needed
# Actually, let's keep run_event strictly for a command list if we want compatibility, or refactor.
# In NPC.gd (prev S1), we called run_event(commands).
# NPC.gd needs refactor anyway (Task 2.5). So we can change API here.

func run_commands(commands: Array) -> void:
	print("[EVT] Starting commands execution: ", commands.size())
	
	for cmd in commands:
		EventCommands.execute(cmd, self)
		
		# Blocking logic for 'say' and 'wait'
		var cmd_name = cmd.get("cmd")
		
		if cmd_name == "say":
			var dialog_ui = get_tree().get_first_node_in_group("ui_dialog")
			if dialog_ui:
				await dialog_ui.dialog_finished
				
		elif cmd_name == "wait":
			var sec = cmd.get("seconds", 1.0)
			await get_tree().create_timer(sec).timeout
			
	print("[EVT] Commands finished.")
