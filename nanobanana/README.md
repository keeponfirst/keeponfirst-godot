# Nanobanana Prompts (Image Gen)

此目錄用於存放未來生成美術素材的 Prompt 文件。
目前 PoC 階段使用色塊 (ColorRect) 與 Godot Icon，暫不需要產圖。

## 未來規劃
- **UI Assets**: 
  - 對話框背景 (9-slice): 水墨風格，半透明。
  - 按鈕: 毛筆字風格。
- **Characters**:
  - 主角: 少年俠客，勁裝。
  - 村長: 白鬍老者。
  - 山賊: 粗曠漢子。
- **Icons**:
  - 技能圖示: 拳頭、劍。
  - 物品圖示: 草藥、書籍。

## 產圖流程 (KOF Workflow)
1. 在此目錄建立 `gen_ui.md` 或 `gen_chars.md`。
2. 描述所需的圖片風格 (Style: Ink wash painting, Wuxia, minimalistic)。
3. 使用 Jules 或 Midjourney 生成。
4. 將圖片放入 `godot/assets/` 目錄。
