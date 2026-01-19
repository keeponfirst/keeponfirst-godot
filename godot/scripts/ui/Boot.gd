extends Control

func _ready():
	print("[BOOT] start")
	if FeatureFlags.DEBUG_LOGS:
		print("[BOOT] Debug logs enabled")
		
	# Simple timer to switch scene
	# Using create_timer to wait 0.5 seconds
	await get_tree().create_timer(0.5).timeout
	
	SceneRouter.goto_scene("res://scenes/town.tscn")
