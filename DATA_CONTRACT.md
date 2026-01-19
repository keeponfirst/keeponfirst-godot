# DATA_CONTRACT.md — PoC Data Rules

## events.json
All story and quest logic MUST live here.
No story branching in code.

---

## Supported Commands
- say
- set_flag
- give_item
- remove_item
- start_battle
- goto_scene

Example:
```json
{ "set_flag": { "key": "quest_herb_done", "value": true } }

---

## Supported Conditions
	•	flag
	•	flag_not
	•	has_item

---

## Forbidden
	•	Custom commands
	•	Nested logic
	•	Script-only story logic

If a command or condition is not listed here,
it MUST NOT be used in the PoC.

---
