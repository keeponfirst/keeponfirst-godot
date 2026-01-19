extends Node
# Autoload: SceneRouter

func goto_scene(path: String) -> void:
	print("[SCENE] goto_scene: %s" % path)
	# Check if file exists to avoid crash
	if not FileAccess.file_exists(path):
		printerr("[SCENE] Error: Scene not found at ", path)
		return
		
	var err = get_tree().change_scene_to_file(path)
	if err != OK:
		printerr("[SCENE] Error changing scene: ", err)
