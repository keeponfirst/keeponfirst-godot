# 01_product_spec.md — 產品規格與體驗

## 1. 玩家體驗 (User Journey)
### 步驟 1：初入江湖
- **場景**: `boot.tscn` 自動跳轉至 `town.tscn`。
- **畫面**: 簡樸，左上角顯示 HP/MP，右下角顯示金錢。
- **目標**: 看到一個 NPC（村長）。

### 步驟 2：接取任務
- **操作**: 玩家走近村長，按下 **E** (Interact)。
- **反饋**: 跳出對話框（直接顯示文字，無逐字動畫）。
- **內容**: 「近日山賊橫行，年輕人你能去教訓他們嗎？」
- **選項**: 「沒問題 (Accept)」、「我再想想 (Cancel)」。
- **結果**: 選擇「沒問題」後，系統提示「任務開始：討伐山賊」，Console 印出 Flag 變更。

### 步驟 3：野外遇敵
- **操作**: 玩家走到村口傳送點。
- **轉場**: 切換至 `overworld.tscn`。
- **遇敵**: 走到地圖上的「山賊據點」觸發區 (Area2D)。
- **轉場**: 切換至 `battle.tscn`。

### 步驟 4：回合制戰鬥
- **畫面**: 雙方列於畫面兩側 (2D Side View 或 Top-Down 皆可，PoC 方便為主)。
- **UI**: 顯示指令選單：【攻擊】、【武功】、【道具】、【防禦】。
- **流程**:
    1. 玩家回合：選擇「野球拳」攻擊山賊。
    2. 結算：顯示傷害數值。
    3. 敵方回合：山賊反擊。
    4. 循環直至一方 HP <= 0。
- **勝利**: 顯示「戰鬥勝利！獲得：草藥、50 文錢」，Console 印出 Inventory 變更。
- **返回**: 自動切回 `overworld.tscn` 或 `town.tscn`。

### 步驟 5：回報與成長
- **操作**: 回到 `town.tscn` 再次與村長對話（按 **E**）。
- **內容**: 村長：「多謝少俠！這本《入門心法》就送給你了。」
- **結果**: 顯示「獲得物品：入門心法」。
- **Flag**: 村口的封條解除（或是 console 印出 `gate_open=true`）。

## 2. 操作與 UI 規範
### 2.1 操控 (Controls) - Input Map
- **move_up, move_down, move_left, move_right**: W, A, S, D / Arrows
- **interact**: E / Space
- **confirm**: E / Enter / Space
- **cancel**: Esc / Backspace

### 2.2 UI 文案風格
- 保持「武俠味」，例如：
    - HP -> 氣血
    - MP -> 內力
    - Start -> 初入江湖
    - Exit -> 金盆洗手
- **注意**：PoC 階段不需逐字顯示效果，對話框文字一次顯示。

## 3. 畫面構成 (Mockup Description)
- **探索模式 (Town/Overworld)**：
    - 主角置中，攝影機 (Camera2D) 跟隨。
    - 使用色塊區分角色：玩家(藍)、NPC(紅)、敵人觸發點(黑)。
- **戰鬥模式 (Battle)**：
    - 獨立場景 `battle.tscn`。
    - 下方固定 UI 顯示指令。

---
**Revision Notes:**
- Added clear scene transition flow.
- Removed typewriter effect requirement.
- Defined Input Map actions explicitly.
