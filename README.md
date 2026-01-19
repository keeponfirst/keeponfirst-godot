# KOF Godot PoC

A KeepOnFirst workflow project to build a **Proof of Concept Wuxia RPG** in Godot 4.x.
Inspired by *Jin Yong Qun Xia Zhuan* (金庸群俠傳), this PoC focuses on validating the "Loop":
`Explore -> Quest -> Battle -> Reward`.

**⚠️ Important**: This is a strictly scoped PoC. Please read `PROMPTS/00_context.md`.

## Project Structure
- `godot/`: The Godot 4.x project folder.
- `PROMPTS/`: Project specifications and documentation.
- `TASK.md`: Current development progress board.
- `WORKER_PROMPT.md`: Template for AI workers.

## Setup & Run (Gate S0)
1. Open Godot 4.x.
2. Import the project from the `godot/` folder.
3. Press **F5** to play.
   - You should see the "BOOT OK" screen.
   - It will automatically transition to "TOWN OK".

## Controls
- **WASD / Arrows**: Move
- **E**: Interact / Confirm
- **Space**: Confirm
- **Esc**: Cancel

## Workflow Rules
See `KOF_RULES.md` and `AGENTS.md` for strict AI and development guidelines.
