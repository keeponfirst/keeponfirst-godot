# AGENTS.md — KOF × Godot Wuxia RPG PoC

## Project Identity
This repository is a **KeepOnFirst (KOF) workflow** project.
Goal: Build a **playable PoC** of a Chinese Wuxia RPG inspired by 金庸群俠傳,
using **Godot 4.x (2D)**.

This is NOT a full game. This is a PoC to validate gameplay loop.

---

## Non-Negotiable Rules (AI MUST OBEY)

### Scope & Workflow
1. Do NOT expand scope beyond the defined PoC loop.
2. Do NOT invent new systems, mechanics, scenes, or data formats.
3. Follow `TASK.md` strictly, **one task card at a time**.
4. Do NOT refactor unrelated code or files.

### Godot Engine Rules
5. Main Scene MUST be `boot.tscn`.
6. `GameState.gd` MUST be an Autoload singleton.
7. All scene transitions MUST go through `SceneRouter.gd`.
8. Scenes must be text-based Godot scenes (`.tscn`) only.
9. Do NOT create binary assets or editor-only files.

### Data & Logic
10. All story flow MUST be data-driven via `events.json`.
11. Do NOT hardcode story logic inside scripts.
12. Only use commands/conditions defined in `DATA_CONTRACT.md`.

---

## Godot Safety Rules (Critical)
- Any change to `project.godot` MUST be explicitly reported:
  - Main Scene
  - Autoload
  - Input Map
- No silent changes to Project Settings.
- If unsure, ASK before changing engine configuration.

---

## Output Contract (Every AI Response)
Every response MUST include:
- Files created / modified
- Godot settings changed (if any)
- How to verify the result in the editor

---

## Definition of Done
A task is DONE only if:
- Acceptance criteria in `TASK.md` are met
- Result is verifiable in Godot Editor
- No scope expansion occurred