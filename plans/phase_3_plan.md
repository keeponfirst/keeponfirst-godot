# Phase 3 Plan: Loop Gate (Battle)

## 1. Goal Definition
Implement the **Turn-Based Battle System** and close the gameplay loop:
`Town -> Quest -> Overworld -> Battle -> Reward -> Town`.

## 2. Done Criteria
- [ ] **Battle Scene**: `battle.tscn` with Player/Enemy sprites and UI.
- [ ] **Battle Engine**: `BattleEngine.gd` managing turns (Player -> Enemy -> Player).
- [ ] **Actions**: Player can Attack (Deal Damage), Enemy attacks back.
- [ ] **Win State**: Enemy HP <= 0 -> Show Victory -> Grant Money/Item -> Return to Map.
- [ ] **Integration**: Overworld trigger calls `start_battle` -> Fights -> Returns.

## 3. Required Scripts & Changes
- `scenes/battle.tscn`: New scene.
- `scripts/battle/BattleEngine.gd`: Core logic state machine.
- `scripts/battle/BattleUI.gd`: UI for commands (Attack, Run).
- `scripts/battle/BattleUnit.gd`: Resource/Node for fighter stats (HP, ATK).
- `scripts/core/SceneRouter.gd`: Ensure `goto_scene` supports return or specific path.
- `data/events.json`: Add `start_battle` event to Overworld trigger.

## 4. Task Breakdown (For Jules)

### CODE Tasks

#### Task 3.1: Battle Scene & UI
- **Goal**: Functional Battle Scene.
- **Files**: 
  - `scenes/battle.tscn`: Background, 2 Fighter Position Nodes, `BattleUI` layer.
  - `scripts/battle/BattleUI.gd`: Signals for `on_attack`, `on_run`.
- **Done when**: Scene runs, UI buttons click and print logs.

#### Task 3.2: Battle Engine (State Machine)
- **Goal**: Turn management.
- **Files**: `scripts/battle/BattleEngine.gd`
- **Logic**:
  - `start_battle(enemy_id)`
  - `player_turn()`: Wait for UI input.
  - `execute_player_attack()`: Calc damage, play anim/log.
  - `enemy_turn()`: Simple AI (Attack player).
  - `check_win_loss()`: If HP < 0, end battle.
- **Done when**: Can play a full turn loop (P->E->P) in log.

#### Task 3.3: Battle Unit & Stats
- **Goal**: Data holder for fighters.
- **Files**: `scripts/battle/BattleUnit.gd` (or just Sprite with script)
- **Logic**: `hp`, `max_hp`, `atk`.
- **Done when**: Units take damage and update HP.

#### Task 3.4: Overworld Integration
- **Goal**: Walk in Overworld -> Trigger Battle.
- **Files**:
  - `scenes/overworld.tscn`: Add Trigger Area with Event.
  - `data/events.json`: Add event `{"cmd": "start_battle", "enemy_group_id": "bandit_01"}`.
- **Done when**: Walking into zone -> Loads Battle Scene -> Win -> Loads Town/Overworld.

### REVIEW Tasks
#### Task 3.5: Verify Loop Gate
- **Goal**: Full playthrough.
- **Steps**:
  1. Boot game.
  2. Talk to Village Chief (Get quest).
  3. Go to Overworld.
  4. Trigger Battle.
  5. Win Battle (Get Loot).
  6. Return to Chief (Complete Quest).
