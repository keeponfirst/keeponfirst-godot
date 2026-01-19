# Phase 2 Plan: Data-Driven Event System (Complete)

## 1. Goal Definition
Fully implement the **Data-Driven Event System** defined in `PROMPTS/02_architecture.md`.
This is the "Brain" of the game, required to handle Quests, Flags, and Transition to Battle.

## 2. Done Criteria
- [ ] **Data Loader**: `DataLoader` autoloads and caches `events.json`, `items.json` on boot.
- [ ] **Conditions**: Events only run if conditions (`flag`, `has_item`) are met.
- [ ] **Full DSL**: Support all required commands:
  - `set_flag` (Updates GameState)
  - `give_item` (Updates GameState)
  - `goto_scene` (Calls SceneRouter)
  - `start_battle` (Placeholder for now, logs to console)
- [ ] **Refactor**: NPC uses `DataLoader` instead of reading file directly.

## 3. Required Scripts & Changes
- `scripts/data/DataLoader.gd` (New): Handles file I/O and JSON parsing.
- `scripts/event/EventCommands.gd` (Update): Add missing commands.
- `scripts/event/EventConditions.gd` (New): Eval logic.
- `scripts/event/EventRunner.gd` (Update): Add condition check loop.
- `scripts/gameplay/NPC.gd` (Update): Use `DataLoader.get_event_data(id)`.
- `project.godot`: Register `DataLoader` as Autoload.

## 4. Task Breakdown (For Jules)

### CODE Tasks

#### Task 2.1: Data Loader System
- **Goal**: Centralized JSON loading.
- **Files**: `scripts/data/DataLoader.gd`
- **Logic**:
  - `_ready()`: loads `res://data/events.json`, `items.json`.
  - `get_event(id)`: returns dictionary.
- **Project Settings**: Add `DataLoader` to Autoload.

#### Task 2.2: Event Conditions
- **Goal**: Implement logic to gating events.
- **Files**: `scripts/event/EventConditions.gd`
- **Logic**:
  - `check(condition_dict) -> bool`
  - Support: `flag`, `flag_not`, `has_item`.

#### Task 2.3: Event Runner Upgrade
- **Goal**: Integrate conditions and loop support.
- **Files**: `scripts/event/EventRunner.gd`
- **Logic**:
  - Before running commands, call `EventConditions.check()`.
  - Only execute if true.

#### Task 2.4: Full DSL Commands
- **Goal**: Implement remaining commands.
- **Files**: `scripts/event/EventCommands.gd`
- **Logic**:
  - `set_flag`: Call `GameState.set_flag`.
  - `give_item`: Call `GameState.add_item`.
  - `goto_scene`: Call `SceneRouter.goto_scene`.
  - `start_battle`: Print `[BATTLE] Start battle with {id}`.

#### Task 2.5: NPC Refactor
- **Goal**: Switch NPC to use DataLoader.
- **Files**: `scripts/gameplay/NPC.gd`
- **Logic**: remove `FileAccess` code, use `DataLoader.game_data.events[npc_id]`.

### REVIEW Tasks
#### Task 2.6: Verification
- **Goal**: Test a multi-step quest (Take quest -> Set Flag -> Talk again -> Different response).
