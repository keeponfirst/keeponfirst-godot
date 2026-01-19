# KOF_RULES.md — KeepOnFirst Workflow Rules

## Core Philosophy
- Playable loop > perfect architecture
- Observability > abstraction
- PoC first, polish later

---

## Gates (Must Pass Sequentially)

### Gate S0 — Stability Gate
- Game renders immediately on run
- Input responds
- No black screen, no silent failure

### Gate G1 — Gameplay Gate
- Player can move
- Player can interact (E key)
- Dialog UI works

### Gate L1 — Loop Gate
- Full PoC loop is playable:
  Town → Quest → Overworld → Battle → Reward → Return

---

## Forbidden Patterns
- Adding features not required by the current gate
- Building future-proof systems before loop completion
- Multi-scene refactors during a gate

---

## Debugging Policy
- Any state change must be observable (log or UI)
- Silent failure is unacceptable
- Debug logs are preferred over comments