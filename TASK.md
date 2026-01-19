# Project Tasks: Godot Wuxia RPG PoC

## Phase 0: Project Setup (Gate S0)
- [x] **Project Init**: 建立 `godot/` 專案，設定 Main Scene 為 `boot.tscn`。 <!-- id: 0 -->
- [x] **Input & Autoloads**: 設定 Input Map (`move_*`, `interact`...) 與 Autoloads (`GameState`, `SceneRouter`). <!-- id: 1 -->
- [x] **Boot Check**: `boot.tscn` 顯示文字並自動跳轉 `town.tscn`。 <!-- id: 2 -->
    - 驗收：按 F5 直接進入 Town（或經過 Boot）。檢查 Autoloads 是否生效。

## Phase 1: Gameplay Gate (可走可互動)
- [ ] **Scenes Setup**: 建立 `town.tscn` (Player, NPC) 與 `overworld.tscn`。 <!-- id: 3 -->
- [ ] **Scripts: Core**: `PlayerController.gd` (move), `Interactable.gd` (E key). <!-- id: 4 -->
- [ ] **UI**: `DialogUI.gd` (無逐字動畫，直接顯示). <!-- id: 5 -->
    - 驗收：WASD 移動，靠近 NPC 按 E 顯示對話框。

## Phase 2: Data-Driven Events (資料驅動事件)
- [ ] **Data Systems**: `DataLoader.gd` 讀取 JSON。 <!-- id: 6 -->
- [ ] **Event Engine**: `EventRunner.gd` 實作 `set_flag`, `say` 等指令。 <!-- id: 7 -->
    - 驗收：執行 Event，Console 印出 `[EVT]` log，GameState 印出 `[STATE]` log。

## Phase 3: Loop Gate (戰鬥閉環)
- [ ] **Battle System**: `battle.tscn`, `BattleEngine.gd` (回合制邏輯). <!-- id: 8 -->
- [ ] **Integration**: Overworld 觸發戰鬥 -> 戰鬥勝利 -> 回城交任務。 <!-- id: 9 -->
    - 驗收：從接任務到交任務完整流程通關。Console 詳細印出所有狀態變更。

---
**Revision Notes:**
- Added Phase 0 (Gate S0) explicitly.
- Clarified verification steps with log requirements.

