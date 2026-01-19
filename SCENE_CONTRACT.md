# SCENE_CONTRACT.md — Godot Scene Contracts

This document defines REQUIRED structure and behavior of scenes.
AI must NOT violate these contracts.

---

## Required Scenes
- boot.tscn
- town.tscn
- overworld.tscn
- battle.tscn

---

## boot.tscn
- Renders visible content immediately (Label or background)
- Logs `[BOOT] start`
- Routes to `town.tscn` via SceneRouter
- No gameplay logic here

---

## town.tscn
- Player node with `PlayerController.gd`
- At least one NPC with `Interactable.gd`
- DialogUI present and functional
- Used for quest accept / complete

---

## overworld.tscn
- Top-down movement enabled
- At least one trigger that starts battle
- No dialog-heavy logic

---

## battle.tscn
- BattleEngine.gd attached
- BattleUI present
- On win:
  - Update GameState
  - Return to town