extends Node
# Autoload: GameState

var flags: Dictionary = {}
var inventory: Array = []
var money: int = 0
var player_stats: Dictionary = {"hp": 100, "max_hp": 100}

func set_flag(key: String, value: bool) -> void:
	flags[key] = value
	print("[STATE] set_flag: %s = %s" % [key, value])

func add_item(item_id: String) -> void:
	inventory.append(item_id)
	print("[STATE] add_item: %s" % item_id)

func has_item(item_id: String) -> bool:
	return item_id in inventory

func add_money(amount: int) -> void:
	money += amount
	print("[STATE] money +%d = %d" % [amount, money])
