extends Interactable
class_name NPC

@export var npc_id: String = "npc_giver"

func interact() -> void:
	print("[GAMEPLAY] Interacted with NPC: ", npc_id)
	
	# Use DataLoader to get cached event data
	# Returns an Array of blocks (dictionaries)
	var event_blocks = DataLoader.get_event_data(npc_id + "_talk")
	
	if event_blocks.size() > 0:
		var runner = EventRunner.new()
		add_child(runner)
		# Now using the Condition-aware runner method
		await runner.run_event_blocks(event_blocks)
		# Cleanup
		runner.queue_free()
	else:
		print("[GAMEPLAY] No events found for ", npc_id)
