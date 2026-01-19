# Gate S1 Plan: Explore - Interact - Reward

## 1. Goal Definition
Establish the minimal **Interactive Gameplay Loop** where a player can move in the town, initiate a dialogue via interaction, and receive a measurable reward (state change) without battle.

## 2. Minimal Player Flow (The Loop)
1. **Explore**:
    - App boots to `Town`.
    - Player character (Blue Square) stands in center.
    - Player controls movement (WASD) around the screen.
2. **Interact**:
    - Player approaches NPC (Red Square).
    - Press **E** to interact.
    - Dialog Interface appears with text: "Take this gold."
3. **Reward**:
    - Player presses **E** to advance/close dialog.
    - System grants 100 gold (Updates `GameState`).
    - Console logs the state change: `[STATE] money +100 = 100`.

## 3. Done Criteria
- [ ] **Movement**: Player Body moves smoothly with WASD/Arrows.
- [ ] **Interaction**: RayCast2D/Area2D correctly detects NPC in front.
- [ ] **Dialog UI**: Shows text when triggered, hides when finished. No errors on multiple triggers.
- [ ] **Data-Driven**: Dialog content comes from `events.json`, NOT hardcoded in GDScript.
- [ ] **Observability**: `GameState` modification prints to Output Console.

## 4. Required Scenes / Nodes
- **Scenes**:
  - `town.tscn` (Modified):
    - `Player` (CharacterBody2D + CollisionShape2D)
    - `NPC` (StaticBody2D + Area2D + ColorRect)
    - `CanvasLayer` (UI root)
  - `ui/dialog_box.tscn` (New):
    - `Panel` + `Label`
- **Scripts**:
  - `scripts/gameplay/PlayerController.gd`
  - `scripts/gameplay/Interactable.gd` (Base class)
  - `scripts/gameplay/NPC.gd` (Inherits Interactable)
  - `scripts/ui/DialogUI.gd`
  - `scripts/event/EventRunner.gd` (Basic version: `say`, `add_money` only)

## 5. Data Structure Requirements
- **`events.json`**:
```json
{
  "npc_giver_talk": [
    {
      "condition": {},
      "commands": [
        { "cmd": "say", "text": "Take this gold." },
        { "cmd": "add_money", "amount": 100 }
      ]
    }
  ]
}
```
*Note: `add_money` needs to be added to EventCommands if not already planned, or use `set_flag` if money is too complex for S1. Let's stick to `add_money` or `give_item` as per original spec if simpler. `add_money` is simpler.*

## 6. S1 Task Breakdown (For Jules)

### CODE Tasks

#### Task 1: Player Movement (Basic)
- **Goal**: Implement WASD movement for Player.
- **Files**:
  - `town.tscn` (Add CharacterBody2D "Player")
  - `scripts/gameplay/PlayerController.gd`
- **Done when**:
  - Player moves with WASD.
  - Collides with screen bounds or walls (optional).

#### Task 2: Interaction System (Core)
- **Goal**: Create base interaction logic.
- **Files**:
  - `scripts/gameplay/Interactable.gd` (class_name Interactable)
  - `scripts/gameplay/PlayerController.gd` (Add RayCast2D or Area2D check logic)
- **Done when**:
  - Pressing E prints "Interact trigger" when facing an object.

#### Task 3: Dialog UI (Visual)
- **Goal**: specific UI scene for showing text.
- **Files**:
  - `scenes/ui/dialog_box.tscn`
  - `scripts/ui/DialogUI.gd`
- **Done when**:
  - calling `DialogUI.show_text("Hello")` displays the box.

#### Task 4: Event Runner (Minimal)
- **Goal**: Parse and execute simple JSON event.
- **Files**:
  - `scripts/event/EventRunner.gd`
  - `scripts/event/EventCommands.gd` (Implement `say`)
- **Done when**:
  - Can pass a dictionary `{"cmd": "say", "text": "Hi"}` and see it in DialogUI.

#### Task 5: NPC & Event Wiring
- **Goal**: Connect NPC interaction to EventRunner.
- **Files**:
  - `scripts/gameplay/NPC.gd`
  - `town.tscn` (Add NPC node with ID)
  - `data/events.json` (Create file)
- **Done when**:
  - Interact with NPC -> Dialog opens with JSON text -> Close Dialog -> Log success.

### ASSETS Tasks (Prompt Only)
*(None for S1 - using ColorRects)*

### REVIEW Tasks
#### Task 6: Gate S1 Verification
- **Goal**: Verify the full loop.
- **Done when**: Manual test confirms Walk -> Talk -> Log Reward sequence.
