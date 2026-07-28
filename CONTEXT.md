# Pack Rat — Domain Glossary

## Game Concept
A visual incremental/idle game about a rat building a nest in an abandoned attic. The player clicks on scattered junk to send the rat scavenging, then uses collected resources to upgrade the nest and unlock automation. The ultimate goal is to craft a Mating Display from Shiny baubles, attracting a mate and completing the nest.

## Core Interactions

- **Scavenge** — click on a junk item in the attic to send the rat to grab it. The rat visibly scurries to the item and drags it back to the nest.

## Terms

### Environment

- **Nest** — the player's base. Grows and upgrades over time. Central visual element.
- **Attic** — the game environment. Contains scattered junk items to scavenge. New areas unlock as the nest expands.

### Resources

| Resource | Source | Early Use | Late Use |
|----------|--------|-----------|----------|
| **Fluff** | Cloth scraps | Nest expansion, basic upgrades | High-tier nest upgrades, baby rats (litter) |
| **Scrap** | Paper bits | Research unlocks | Advanced research, curiosity upgrade (auto-scavenge) |
| **Bait** | Food crumbs | Rat speed boost | Poison delivery, baby rats (litter) |
| **Shiny** | Shiny baubles | — | Mating Display (second rat + win condition), prestige upgrades |
| **Trap Parts** | Disabled traps (mid-game upgrade) | — | Cat Barrier upgrades |
| **Poison** | Collected safely (mid-game upgrade) | — | Lace bait → cat gets sick, longer absence |

### Threats

- **Traps** — passive hazard. Early: rat drops carried item and is stunned. Mid: disable with upgrade, collect Trap Parts. Late: Trap Parts used to build Cat Barrier.
- **Poison** — passive hazard. Early: puddles slow rat. Mid: collect safely with upgrade. Late: lace Bait → cat gets sick.
- **Cat** — active threat. Patrols attic in random pattern, ~20s duration. When present, rat hides, production pauses. Countered by Cat Barrier (permanent) or poisoned bait (temporary extended absence).

### Automation Progression

1. **Manual** — single rat, player clicks to scavenge
2. **Curiosity** (Scrap upgrade) — rat auto-scavenges nearest item occasionally
3. **Mate** (Shiny cost) — second rat arrives, doubles throughput
4. **Litter** (Bait + Fluff invested) — baby rats hatch, more workers
5. **Full colony** — swarm of rats; player manages priorities, not clicks

### Progression Arc

- **Threat → Resource** — traps and poison transition from hazards to crafting materials as the player unlocks upgrades.
- **Mating Display** — ultimate endgame goal. Requires a large Shiny investment. Completing it triggers the game's ending.
