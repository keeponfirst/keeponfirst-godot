extends Node
class_name EventConditions

static func check(conditions: Dictionary) -> bool:
	if conditions.is_empty():
		return true
		
	for key in conditions.keys():
		var expected_val = conditions[key]
		
		match key:
			"flag":
				# expected_val should be string flag_key (if checking true) or dict/array if we want specific values
				# Spec says: "flag": "key_name" implied checking if true? 
				# Or "flag": { "key": "quest_done", "value": true } ?
				# PROMPTS/02_architecture.md says: `flag(flag_key, expected_value)`
				# But JSON example in 03_data_schema.md uses: ` "condition": { "flag": "quest_bandit_done" } ` (Implies check exists/true)
				# Let's support simple string key checking for true
				
				if typeof(expected_val) == TYPE_STRING:
					if GameState.flags.get(expected_val, false) != true:
						# print("[EVT] Condition Fail: flag ", expected_val, " is not true")
						return false
				elif typeof(expected_val) == TYPE_DICTIONARY:
					var f_key = expected_val.get("key", "")
					var f_val = expected_val.get("value", true)
					if GameState.flags.get(f_key, false) != f_val:
						return false

			"flag_not":
				# Check if flag is false or null
				if typeof(expected_val) == TYPE_STRING:
					if GameState.flags.get(expected_val, false) == true:
						# print("[EVT] Condition Fail: flag_not ", expected_val, " is true")
						return false

			"has_item":
				if typeof(expected_val) == TYPE_STRING:
					if not GameState.has_item(expected_val):
						return false
						
			_:
				printerr("[EVT] Unknown condition type: ", key)
				
	return true
