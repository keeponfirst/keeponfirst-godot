extends Node
# Autoload: DataLoader

var game_data: Dictionary = {
	"events": {},
	"items": {},
	"characters": {},
	"skills": {}
}

func _ready() -> void:
	print("[DATA] DataLoader initializing...")
	load_all_data()

func load_all_data() -> void:
	game_data["events"] = load_json_file("res://data/events.json")
	game_data["items"] = load_json_array_to_dict("res://data/items.json", "id")
	# game_data["characters"] = load_json_array_to_dict("res://data/characters.json", "id") # Not created yet
	# game_data["skills"] = load_json_array_to_dict("res://data/skills.json", "id") # Not created yet
	
	print("[DATA] Events loaded: ", game_data["events"].keys())
	print("[DATA] Items loaded: ", game_data["items"].keys())

func load_json_file(path: String) -> Variant:
	if not FileAccess.file_exists(path):
		printerr("[DATA] File not found: ", path)
		return {}
		
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	var err = json.parse(content)
	
	if err != OK:
		printerr("[DATA] JSON Parse Error in ", path, ": ", json.get_error_message())
		return {}
		
	return json.data

func load_json_array_to_dict(path: String, key_field: String) -> Dictionary:
	var data = load_json_file(path)
	var result = {}
	
	if typeof(data) == TYPE_ARRAY:
		for item in data:
			if typeof(item) == TYPE_DICTIONARY and item.has(key_field):
				result[item[key_field]] = item
			else:
				printerr("[DATA] Item missing key field '", key_field, "' in ", path)
	else:
		if typeof(data) != TYPE_DICTIONARY or data.is_empty(): 
			# Allow empty dict if file missing or empty, but warn if it was meant to be array
			pass 
			
	return result

func get_event_data(event_id: String) -> Array:
	if game_data["events"].has(event_id):
		return game_data["events"][event_id]
	printerr("[DATA] Event not found: ", event_id)
	return []

func get_item(item_id: String) -> Dictionary:
	if game_data["items"].has(item_id):
		return game_data["items"][item_id]
	return {}
