# 02_architecture.md — 系統架構設計

## 1. 目錄結構與場景 (Scene Tree)

### `scenes/`
- **boot.tscn (Main)**: 
  - 負責初始化 Global State。
  - 顯示 Loading 文字。
  - 檢查完畢後切換至 `town.tscn`。
- **town.tscn**:
  - `TileMap`: 地圖層 (可用 ColorRect 拼湊)。
  - `Player`: 玩家角色 (CharacterBody2D)。
  - `NPCs`: 包含多個 `NPC` 節點 (Area2D + StaticBody2D)。
  - `CanvasLayer (UI)`: `DialogUI`, `HUD`.
- **overworld.tscn**:
  - 野外場景，包含前往 Battle 的觸發點。
- **battle.tscn**:
  - 獨立戰鬥場景，包含 `BattleUI`。

## 2. 核心腳本 (Core Scripts)

請嚴格遵守以下路徑結構：

### `scripts/core/`
- **GameState.gd** (Autoload): 
  - 變數：`flags` (Dict), `inventory` (Array), `money` (int), `player_stats` (Dict)。
  - **必做**: 狀態變更時必須 `print()`，例如 `[GameState] set_flag: quest_01 = true`。
- **SceneRouter.gd** (Autoload): 
  - `goto_scene(scene_path)`: 處理場景切換。
- **FeatureFlags.gd** (Autoload):
  - `const DEBUG_LOGS = true`

### `scripts/event/`
- **EventRunner.gd**: 
  - 解析 JSON command。
  - **必做**: 每執行一個指令都印出 `[EVT] command_name params`。
- **EventCommands.gd**: 實作 `say`, `set_flag`, `give_item` 等具體邏輯。
- **EventConditions.gd**: 實作 `flag`, `flag_not`, `has_item` 等檢查邏輯。

### `scripts/gameplay/`
- **PlayerController.gd**: 處理 Input Map (`move_*`) 與移動。
- **NPC.gd**: 繼承 `Interactable`，持有 `npc_id` 用於查詢 Event。
- **Interactable.gd**: 定義 `interact()` 介面。

### `scripts/battle/`
- **BattleEngine.gd**: 處理回合流程狀態機。
  - **必做**: 結算時印出 `[BATTLE] win -> give item herb_001`。
- **BattleAI.gd**: 簡單的敵人 AI (隨機攻擊)。

### `scripts/ui/`
- **DialogUI.gd**: 顯示對話框 (無逐字動畫)。
- **HUD.gd**: 顯示 HP/Money。

### `scripts/data/`
- **DataLoader.gd**: 讀取 `godot/data/*.json`。

## 3. 事件系統 DSL (Domain Specific Language)
事件定義在 JSON 中。

### 統一 Commands
1.  `say(speaker_id, text)`
2.  `give_item(item_id, count)`
3.  `remove_item(item_id, count)`
4.  `set_flag(flag_key, value)` (**注意**: 統一使用 `set_flag`，停用 `add_flag`)
5.  `start_battle(enemy_group_id)`
6.  `goto_scene(scene_name)`
7.  `wait(seconds)`

### 統一 Conditions
1.  `flag(flag_key, expected_value)`: 檢查 `flags[key] == expected_value`。
2.  `flag_not(flag_key)`: 檢查 `flags` 中不存在該 key，或值為 false。
3.  `has_item(item_id)`: 檢查擁有道具。

## 4. Loop Probe (可觀測性要求)
為確保 PoC 邏輯正確，所有關鍵系統必須有詳細 Log：
- **GameState**: `[STATE] flag {key} changed to {val}`, `[STATE] money +{amount}`
- **Event**: `[EVT] run line {index}: {cmd}`
- **Battle**: `[BATTLE] Turn: Player`, `[BATTLE] Damage: 10`

---
**Revision Notes:**
- Standardized script paths (`scripts/core`, `scripts/event`, etc.).
- Unified DSL: Enforced `set_flag`.
- Added explicit Logging/Observability requirements.
- Defined `overworld.tscn` role.
