# Project Tasks: Godot Wuxia RPG PoC

## Phase 0: Project Setup (Gate S0)
- [x] **Project Init**: 建立 `godot/` 專案，設定 Main Scene 為 `boot.tscn`。 <!-- id: 0 -->
- [x] **Input & Autoloads**: 設定 Input Map (`move_*`, `interact`...) 與 Autoloads (`GameState`, `SceneRouter`). <!-- id: 1 -->
- [x] **Boot Check**: `boot.tscn` 顯示文字並自動跳轉 `town.tscn`。 <!-- id: 2 -->
    - 驗收：按 F5 直接進入 Town（或經過 Boot）。檢查 Autoloads 是否生效。

## Phase 1: Gameplay Gate (Gate S1 Loop)
- [x] **Player Movement**: Implement WASD for Player in `town.tscn` & `PlayerController.gd`. <!-- id: 3 -->
    - Verified when: Player moves with WASD.
- [x] **Interaction Core**: Base `Interactable.gd` and Player RayCast logic. <!-- id: 4 -->
    - Verified when: Pressing E prints "Interact trigger" when facing object.
- [x] **Dialog UI**: Create `dialog_box.tscn` and `DialogUI.gd` logic. <!-- id: 5 -->
    - Verified when: `DialogUI.show_text()` works.
- [x] **Event Runner**: `EventRunner.gd` with `say` and `add_money` commands. <!-- id: 6 -->
    - Verified when: JSON event triggers UI and Money log.
- [x] **NPC Wiring**: `NPC.gd`, `town.tscn` update, `events.json` creation. <!-- id: 7 -->
    - Verified when: Full interaction loop works (Talk -> Close -> Money).
- [x] **Gate S1 Verify**: Manual playthrough of the loop. <!-- id: 8 -->
    - Verified when: All criteria in `plans/gate_s1_plan.md` passed.

## Phase 2: Data-Driven Events (Complete System)
- [x] **Data Loader**: `DataLoader.gd` loading `events.json`, `items.json`. <!-- id: 6 -->
    - Verified when: Autoload works, data is cached.
- [x] **Event Conditions**: `EventConditions.gd` (`flag`, `has_item`). <!-- id: 7 -->
    - Verified when: `check()` returns correct bool based on GameState.
- [x] **Event Runner Upgrade**: Integrate Conditions and Loop logic. <!-- id: 9 -->
    - Verified when: Events comply with start criteria.
- [x] **Full DSL Commands**: `set_flag`, `give_item`, `goto_scene`, `start_battle`. <!-- id: 10 -->
    - Verified when: Commands execute correctly in logs/state.
- [x] **NPC Refactor**: Switch NPC to use `DataLoader`. <!-- id: 11 -->
    - Verified when: NPC behavior remains consistent but uses cached data.
- [x] **Phase 2 Verify**: Multi-step quest test. <!-- id: 12 -->
    - Verified when: Test plan passed.

## Phase 3: Loop Gate (戰鬥閉環)
- [ ] **Battle System**: `battle.tscn`, `BattleEngine.gd` (回合制邏輯). <!-- id: 8 -->
- [ ] **Integration**: Overworld 觸發戰鬥 -> 戰鬥勝利 -> 回城交任務。 <!-- id: 9 -->
    - 驗收：從接任務到交任務完整流程通關。Console 詳細印出所有狀態變更。

---
**Revision Notes:**
- Added Phase 0 (Gate S0) explicitly.
- Clarified verification steps with log requirements.

