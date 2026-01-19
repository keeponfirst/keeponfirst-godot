# 04_test_plan.md — 驗收測試計畫 (Verification Plan)

## Gate S0: Project Settings (環境設定測試)
- **檢查項目**:
    1.  `project.godot` 中 Main Scene 設定為 `res://scenes/boot.tscn`。
    2.  Project Settings -> Autoloads 包含：
        - `GameState` -> `res://scripts/core/GameState.gd`
        - `SceneRouter` -> `res://scripts/core/SceneRouter.gd`
        - `FeatureFlags` -> `res://scripts/core/FeatureFlags.gd`
    3.  Input Map 設定完成：`move_up/down/left/right`, `interact`, `confirm`, `cancel`。
- **步驟**: 按 F5 (Play Project)。
- **預期**: 進入 Boot 畫面，隨即自動跳轉至 Town 畫面（或停留在 Boot 顯示 OK）。Console 無紅字錯誤。

## Gate 1: Gameplay (互動與移動)
- **移動**:
    - **步驟**: 在 `Town` 場景按 WASD。
    - **預期**: 玩家移動順暢。
- **對話**:
    - **步驟**: 走到 NPC 旁，按 E 鍵。
    - **預期**: 顯示對話框。Console 印出 `[EVT] say ...`。
    - **步驟**: 按 E/Space 推進。
    - **預期**: 對話結束。

## Gate 2: Data & Events (資料驅動)
- **Flag 變更**:
    - **步驟**: 觸發第一次對話（接任務）。
    - **預期**: Console 印出 `[STATE] set_flag: quest_bandit_started = true`。
- **狀態判定**:
    - **步驟**: 再次對話。
    - **預期**: NPC 說不同的話（因為 flag 已存在）。

## Gate 3: Loop (閉環測試)
- **戰鬥流程**:
    - **步驟**: 走到 `Overworld` 觸發點 -> 進入 `Battle`。
    - **預期**: Console 印出 `[SCENE] goto_scene: battle`。
    - **步驟**: 戰鬥勝利。
    - **預期**: Console 印出 `[BATTLE] Win`, `[STATE] Add item: herb_001`。
- **任務完成**:
    - **步驟**: 回 Town 交任務。
    - **預期**: 獲得心法，Console 印出 `[STATE] Add item: book_intro`。

---
**Revision Notes:**
- Added Gate S0 for project settings verification.
- Enforced Console Log checks in validation steps.
- Updated scene references (`Overworld` instead of generic term).
