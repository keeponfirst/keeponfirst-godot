# 00_context.md — 專案背景與範疇

## 1. 專案目標
使用 Godot 4.x 構建一個 **2D 俯視角武俠 RPG** 的 **Proof of Concept (PoC)**。
靈感來源為《金庸群俠傳》風格，重點在於驗證「開放世界探索 + 資料驅動敘事 + 回合制戰鬥」的核心技術迴圈，而非美術表現。

## 2. 核心體驗 (The Loop)
玩家需能夠在遊戲中完成以下完整流程：
1.  **Boot**: 啟動遊戲，初始化 Autoloads，自動進入 Town。
2.  **Town (探索)**：在城鎮場景移動，與 NPC 對話，接取任務（Events）。
3.  **Overworld (移動)**：前往野外場景，移動至特定地點觸發戰鬥。
4.  **Battle (戰鬥)**：進入獨立戰鬥場景，擊敗敵人。
5.  **Rewards (獎勵)**：獲得戰利品（Item/Money），自動返回 Overworld 或 Town。
6.  **Narrative (敘事)**：回到 Town 交回任務，觸發世界狀態改變（Flags）。

## 3. 非目標 (Out of Scope)
在此 PoC 階段，嚴格禁止以下開發：
- ❌ **大地圖 (World Map)**：僅需 `town.tscn` 與 `overworld.tscn` 兩個探索場景切換。
- ❌ **多門派/多角色**：僅需單一主角。
- ❌ **複雜武功系統**：僅需「普通攻擊」與「一招武功」即可。
- ❌ **存檔系統**：暫不需要 Save/Load。
- ❌ **精緻美術**：使用色塊 (ColorRect) 或 Godot icon 代表角色即可。
- ❌ **音效/音樂**：非必要。
- ❌ **逐字顯示 (Typewriter Effect)**：對話框直接顯示完整文字即可。

## 4. 技術限制
- **引擎**：Godot 4.x (GDScript)。
- **架構**：嚴格遵守 KOF 架構（Scenes, Scripts, Data 分離）。
- **資料**：所有劇情、對話、物品必須由 JSON 資料驅動，禁止 Hardcode 文字在程式碼中。
- **可觀測性**：關鍵邏輯（Event, Battle, State）必須印出 Console Log 以利除錯。

---
**Revision Notes:**
- Clarified scene flow: Boot -> Town -> Overworld -> Battle.
- Removed Typewriter Effect from scope.
- Added Observability requirement.
