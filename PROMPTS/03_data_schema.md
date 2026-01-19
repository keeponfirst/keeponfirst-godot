# 03_data_schema.md — 資料結構定義

所有遊戲資料存放於 `godot/data/` 目錄下。

## 1. 物品資料 (`items.json`)
```json
[
  {
    "id": "herb_001",
    "name": "草藥",
    "description": "路邊常見的草藥，有些微止血效果。",
    "type": "consumable",
    "effect": { "hp": 20 },
    "price": 10
  },
  {
    "id": "book_intro",
    "name": "入門心法",
    "description": "記載基礎吐納之法的破舊冊子。",
    "type": "key_item",
    "price": 0
  }
]
```

## 2. 角色資料 (`characters.json`)
```json
[
  {
    "id": "bandit_001",
    "name": "山賊喽囉",
    "hp": 50,
    "max_hp": 50,
    "attack": 8,
    "defense": 2,
    "speed": 5,
    "drops": [
      { "item_id": "herb_001", "chance": 1.0 },
      { "money": 10, "chance": 1.0 }
    ],
    "skills": ["punch"]
  }
]
```

## 3. 武功資料 (`skills.json`)
```json
[
  {
    "id": "punch",
    "name": "野球拳",
    "type": "attack",
    "power": 10,
    "cost_mp": 0,
    "animation": "punch_anim"
  }
]
```

## 4. 事件資料 (`events.json`)
**注意**: 統一使用 `set_flag` 指令。

```json
{
  "npc_chief_talk": [
    {
      "condition": { "flag_not": "quest_bandit_started" },
      "commands": [
        { "cmd": "say", "speaker": "村長", "text": "近日山賊橫行，年輕人你能去教訓他們嗎？" },
        { "cmd": "set_flag", "key": "quest_bandit_started", "val": true },
        { "cmd": "say", "speaker": "系統", "text": "任務開始：討伐山賊" }
      ]
    },
    {
      "condition": { "flag": "quest_bandit_done" },
      "commands": [
        { "cmd": "say", "speaker": "村長", "text": "多謝少俠！這本《入門心法》就送給你了。" },
        { "cmd": "give_item", "id": "book_intro", "count": 1 },
        { "cmd": "set_flag", "key": "gate_open", "val": true },
        { "cmd": "say", "speaker": "系統", "text": "獲得物品：入門心法" }
      ]
    },
    {
      "condition": {},
      "commands": [
        { "cmd": "say", "speaker": "村長", "text": "快去吧，別讓大家失望。" }
      ]
    }
  ]
}
```

---
**Revision Notes:**
- Unified DSL: Replaced `add_flag` with `set_flag` in examples.
- Adjusted bandit drop chance to 1.0 for easier PoC testing.
