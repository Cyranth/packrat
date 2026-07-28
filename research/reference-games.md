# Reference Games: Design Research for Pack Rat

> Analysis of 5 successful visual incremental/idle games to inform Pack Rat's design.
> Compiled July 2026.

---

## 1. (the) Gnorp Apologue

| Metric | Value |
|---|---|
| Developer | Myco (solo dev) |
| Engine | Unknown (solo dev learned new language for it) |
| Price | $6.99 |
| Est. Gross Revenue | ~$1.4M |
| Est. Copies Sold | ~229K |
| Steam Rating | Overwhelmingly Positive |
| Dev Time | ~1 year from prototype to full release |

### Core Gameplay Loop
Gnorps (cute creatures) hit a rock → rock outputs shards → shards pile up → other gnorps collect shards → spend shards on housing/buildings → assign gnorps to more efficient jobs → repeat until the "compression" event.

The rock is infinitely abundant. The core tension is between raw output (hitting the rock) and logistics (collecting the shards that scatter).

### Resources / Currencies
- **Shards** — primary currency, mined from rock, spent on buildings/upgrades
- **Condensed Shards** — earned after a "compression" event (pile fills up), worth more than regular shards
- **Zybellium** — limited currency earned per compression; spent on big permanent upgrades (new buildings, weapon upgrades, gnorp types). Finite per run — forces strategic choices.
- **Prestige Points / Talent Points** — earned on hitting collection rate thresholds; spent on talent board between runs

### Upgrade Types & Tree Structure
- **Buildings** — each houses a gnorp type (Slammer, Runner, Mountaineer, Rocket, Flower, etc.)
- **Upgrades per building** — modify gnorp behavior (e.g., turn arrows to rockets, guns to machine guns)
- **Talent Board** — grouped into blocks; adds fire/ice elements, enables new buildings, allows multiple effects to run concurrently
- **Multiplier** — tied to number of gnorps (not shards spent). Grows predictably, incentivizes growing gnorp population
- Design philosophy: upgrades should "change behavior, not be mandatory, work in tandem with talents"

### Prestige Mechanics
- **Compression** — when shard pile fills up, it compresses → sucked back into rock. Each compression makes the rock angrier (stronger vacuum pulling shards back). Goal: survive 10 compressions.
- **Zybellium** — awarded per compression, limited per run, spent on run-defining upgrades
- **Prestige** — triggered on hitting shard collection thresholds; awards talent points for the permanent talent board
- Runs typically restart when the rock's vacuum overwhelms your collection rate
- Each run informs build strategy for the next

### Automation Unlock Path
1. Manual clicking (hold click)
2. First gnorps appear → auto-collection starts
3. More buildings unlock → assign gnorps to automated roles
4. Upgrades improve automation speed/efficiency
5. Late-game: full automation with strategic macro-management

### UI Layout
- Initially: standard UI overlay on game screen
- Evolved: buildings are clickable on the game map → popup shows upgrades and gnorp assignments
- The game itself (rock + gnorps + particle chaos) IS the main visual
- UI avoids bloat by embedding upgrades in their building locations

### What Makes It "Fun" / The Hook
- **Spectacle** — thousands of individually-simulated gnorps and shards flying around. "Excessive" is the point.
- **Build synergy** — theorycrafting different builds (freeze arrows, feedback loops, etc.)
- **Physicality** — seeing units on screen, not just numbers
- **Risk/reward** — Zybellium is limited, so choices lock you into a strategy for the run
- **Ending** — game has a definitive ending (10 compressions → final building → "forever mining"), which is rare in the genre
- **Cute aesthetics** — gnorps have personality, animations are charming

### Estimated Complexity to Implement
**High (7-8/10).** Key challenges:
- Individual unit simulation with pathfinding (thousands of gnorps)
- Particle system for shard physics
- Compression mechanic with escalating difficulty
- Balancing asymmetric upgrade scaling across ~12 different unit types
- Talent board with meaningful cross-synergies
- Zybellium economy (finite resource per run)
- UI embedded in game world (clickable buildings)

---

## 2. Rusty's Retirement

| Metric | Value |
|---|---|
| Developer | Mister Morris Games (solo dev) |
| Engine | Unknown (previously made Haiku, the Robot) |
| Price | $6.99 |
| Est. Gross Revenue | ~$2.9M - $4.5M |
| Est. Copies Sold | ~562K |
| Steam Rating | Very Positive |
| Dev Time | ~1-2 years |

### Core Gameplay Loop
Plant seeds → Rusty waters them → crops grow → harvest for Spare Parts → convert crops to Biofuel → convert Biofuel to more Spare Parts → build homes for robot friends → unlock automation → expand farm → unlock new farm biomes.

The loop is intentionally slow-paced — Rusty is retired and takes his time.

### Resources / Currencies
- **Spare Parts (Gold)** — primary currency from selling harvested crops
- **Biofuel** — secondary currency, created by processing crops in a converter. Needed for robot automation.
- **Crops** — 7+ types (wheat, radish, cabbage, carrot, tomato, etc.), each with different grow times and regrow cycles
- **Screen space** — the real "resource" to manage; farm expands and you zoom in/out

### Upgrade Types & Tree Structure
- **Crop unlocks** — more crops unlock as you harvest enough of previous tiers
- **Robot helpers** — Haiku (building), Pinion (stats), plus automate planting/watering/harvesting
- **Bot upgrades** — efficiency, carry capacity, speed
- **Farm biomes** — swamp (restrictions), desert (water management), cherry blossom, oasis
- **Buildings** — homes for friends, biofuel converters, storage units, animal feeders, etc.
- **Decorations** — cosmetic only, for the retirement vibe

No traditional "upgrade tree" — progression is gated by accumulated production.

### Prestige Mechanics
**None.** No prestige reset. Progression is purely forward: unlock all biomes, build all homes, then decorate. The game "ends" when all content is unlocked; some players turn it into a sandbox at that point.

Not having prestige is a deliberate design choice to keep the game relaxing.

### Automation Unlock Path
1. All manual — Rusty does tasks when you click to assign
2. Haiku robot — helps with building construction
3. Harvest bots — auto-harvest crops
4. Watering bots — auto-water
5. Planting bots — auto-plant
6. Beehives — passive biofuel generation
7. Full automation — the farm runs itself; you just check in

### UI Layout
- The game sits at the **bottom of your screen** as a persistent bar
- **Vertical mode** also available (sits at side of screen)
- **Focus mode** — slows production for when you need to concentrate on work
- Full screen mode available but the desktop companion gimmick is the hook
- UI is minimalist — crops tab, buildings tab, inventory
- Twitch integration for streamer/viewer interaction

### What Makes It "Fun" / The Hook
- **Desktop companion** — plays while you work, no full screen commitment
- **Cozy aesthetic** — pixel art robot retirement with ambient music, leaves falling, bees, robot idles
- **Zero pressure** — no fail states, no time pressure, no punishing mechanics
- **Visual satisfaction** — watching robots do their chores efficiently
- **Progression without anxiety** — everything you do has positive impact
- **Screen as resource** — managing window real estate is novel
- **Cute details** — robots sit on benches, chimneys smoke, Rusty is adorable

### Estimated Complexity to Implement
**Medium-High (6/10).** Key challenges:
- Desktop overlay rendering (bottom bar / side panel)
- Robot pathfinding and task prioritization system
- Crop growth simulation with regrow cycles
- Multiple farm biomes with unique rules
- Automation upgrade chain balancing
- Pixel art for all crops, robots, buildings, animations
- Twitch integration

---

## 3. Scritchy Scratchy

| Metric | Value |
|---|---|
| Developer | Lunch Money Games / Funday Games |
| Price | $6.99 |
| Est. Gross Revenue | ~$3M+ in first month |
| Steam Rating | Overwhelmingly Positive (95%) |
| Released | March 2026 |

### Core Gameplay Loop
Start with washing dishes to earn cash → buy scratch card tickets → drag mouse to scratch off coating → reveal symbols → win money or trigger penalties → buy bigger tickets with higher stakes → unlock automation → prestige → repeat.

The "scratching" is physical mouse-dragging, not button clicking — this tactile feedback is the core innovation.

### Resources / Currencies
- **Cash** — primary currency from scratching tickets (and initially from washing dishes)
- **Jack Points (JP)** — prestige currency, permanent across runs

### Upgrade Types & Tree Structure
Four catalogues, each with 6 categories of upgrades:
1. **Luck** — most important early; improves win odds
2. **Scratch Power** — scratch area size, coin hardness for tougher tickets
3. **Multipliers** — dominate late-game math
4. **Automation** — unlocks Scratch Bot (processes cards automatically)
5. **Quality of Life** — spacebar confirm, auto-swipe, etc.
6. **Card tiers** — Quick Cash (safe) → Snake Eyes → Lucky Cat → Final Chance (triggers prestige)

Upgrades branch and interact. The optimal strategy is Luck first, Automation mid-game, Multipliers late.

### Prestige Mechanics
- Triggered by scratching a "Final Chance" card
- Resets current run but awards **Jack Points (JP)**
- JP spent on permanent upgrades that persist across all runs
- Each run is faster than the last
- Timing matters — too early gives minimal JP and a disadvantaged restart
- Recommended: don't prestige on first run; farm JP from jackpots first

### Automation Unlock Path
1. All manual — mouse-scratch every card
2. Auto-swipe upgrade — painfully slow but reduces effort
3. **Scratch Bot** — mid-game purchasable upgrade; processes cards from a queue automatically
4. Queue capacity and speed scale with further upgrades
5. **Mundo** — NPC that scratches cards for you (with quirks — he triggers penalties)
6. **Fan** — blows tickets into the bot for processing
7. Full idle — bot handles everything; player just sets card type and queue

### UI Layout
- Single-screen view of the ticket on a desk/table
- Scratch zone is the main interaction area
- Side panels show balance, upgrade catalogues, stats
- Card catalogue selector
- Prestige button / Final Chance card
- Settings for auto-scratch, sound, etc.
- Minimalist, focused entirely on the ticket and its symbols

### What Makes It "Fun" / The Hook
- **Tactile scratching** — physically dragging to reveal is satisfying and novel
- **Gambling dopamine** — the same psychological hooks as scratch-off lottery tickets
- **Risk management** — partial scratching (peeking) is a skill; trap symbols only penalize if fully revealed
- **Progression through luck** — improving odds creates a "luck engine" feel
- **Automation fantasy** — building a machine that scratches for you is rewarding
- **Controversial addiction factor** — reviewers note it's dangerously compelling

### Estimated Complexity to Implement
**Low-Medium (4/10).** Key challenges:
- Mouse-drag scratch card rendering (reveal layer mechanics)
- Symbol generation and payout table balancing
- Trap/penalty system with partial reveal detection
- Prestige economy (Jack Point curve)
- Bot automation system
- Multiple card types with unique rule sets
- AI asset concerns flagged by community

---

## 4. All Hail the Orb

| Metric | Value |
|---|---|
| Developer | LeGingerDev (solo dev) |
| Price | $6.99 |
| Est. Gross Revenue | ~$198K - $298K |
| Est. Copies Sold | ~32K - 50K |
| Steam Rating | Overwhelmingly Positive (93%) |
| Dev Time | ~4.5 months |
| Playtime | 2-4 hours to credits |

### Core Gameplay Loop
Click Orb → generate Devotion → summon cultists → cultists auto-generate Devotion → explore dungeon rooms → unlock new mechanics → upgrade everything → free the entity in the Orb → credits.

The loop shifts from active clicking to management as automation takes over.

### Resources / Currencies
- **Devotion** — primary resource, generated by clicking and cultists
- **Cultists** — workers that automate devotion generation; have energy and need rest
- **Duck Energy** — late-game resource from duck gacha portal; used for final skill tree
- **Dungeon Rooms** — not a currency, but content gates that introduce new systems

### Upgrade Types & Tree Structure
No "tree" in the traditional sense — upgrades are:
- **Cultist upgrades** — efficiency, energy, speed, auto-rest
- **Dungeon room unlocks** — each room adds a new mechanic (mushroom cave, pillars, diamonds, books, etc.)
- **Obelisk milestones** — 5 stages of progression; each requires a resource sacrifice to unlock
- **Duck gacha** — late-game merge/rarity system for duck energy generation

The system is **flat and linear** — no branching tree, just progressive unlock gated by resource thresholds.

### Prestige Mechanics
**None.** All Hail the Orb deliberately avoids prestige. Progress is always forward. The game ends when you free the entity. 2-4 hours, then done.

The developer's philosophy: "No fail states, no punishing setbacks, completion is guaranteed."

Players who liked the game want more. Some wanted prestige for replayability. This was a polarizing design choice.

### Automation Unlock Path
1. Manual clicking (hold left click — game supports hold-to-click)
2. First cultist summoned → some auto-generation starts
3. More cultists → rest/energy management becomes the focus
4. Cultist upgrades → auto-rest, faster generation
5. Dungeon rooms → new interactive elements (clickable pillars, etc.)
6. Mushroom cave → passive resource generation
7. Duck portal → late-game passive energy
8. Near-full automation by last 30% of the game

Importantly: **this is NOT an idle game**. Progress pauses when you close the app.

### UI Layout
- Orb centered on screen — main click target
- Dungeon rooms to the sides — navigable via clicking edges
- Resource counters at top
- Cultist management panel with assignment and upgrades
- Building notification icons (can get cluttered)
- Achievement popups
- Pixel art style with satisfying particle effects

### What Makes It "Fun" / The Hook
- **Respects your time** — 2-4 hours, complete experience, no padding
- **Automation shift** — the moment clicking becomes optional is genuinely satisfying
- **Dungeon exploration** — rooms as content gates keep things fresh
- **No fail states** — relaxing, accessible, zero anxiety
- **Humor** — tongue-in-cheek writing, the duck, absurd cult recruitment
- **Visual/audio feedback** — sparks, shakes, reactions on every click
- **Achievements** — 46 well-designed achievements that reward exploration

### Estimated Complexity to Implement
**Low (3/10).** Key challenges:
- Simple clicker math progression
- Room-dungeon system with content gates
- Cultist simulation (energy, movement, rest)
- Duck gacha system (merge/rarity)
- Balancing 2-4 hour playtime
- Pixel art for multiple room themes

---

## 5. Void Miner

| Metric | Value |
|---|---|
| Developer | RyanJakob |
| Publisher | TreeFall Studios |
| Price | ~$4 (discounted low price strategy) |
| Est. Gross Revenue | ~$127K - $142K |
| Est. Copies Sold | ~29K - 32K |
| Steam Rating | Very Positive (84%) |
| Playtime | 2-3 hours campaign + endless mode |

### Core Gameplay Loop
Pilot a top-down ship → blast asteroids → collect gems/resources → between waves, spend on upgrade tree → survive harder waves → protect the mothership → 15 waves to beat campaign → endless mode.

Mix of active shooter gameplay and incremental meta-progression.

### Resources / Currencies
- **Gems** — dropped by asteroids, spent on upgrades between runs
- **Oxygen** — determines run length; most important early upgrade
- **Health** — ship durability; degrades visually as damage accumulates
- **Time** — each run has a natural endpoint via oxygen depletion

### Upgrade Types & Tree Structure
**Branching upgrade tree** with categories:
1. **Firepower** — weapon damage, fire rate, auto-laser
2. **Survivability** — health, shields, armor
3. **Oxygen** — run duration extension (most important early)
4. **Resource pull rate** — gem magnet range, collection speed
5. **Mothership** — automated tower in center of map; expensive but game-changing

Tree has meaningful branching — upgrades are permanent (Rogue Legacy-style skill tree). The auto-laser upgrade is notably overtuned and flattens mid-game tension.

### Prestige Mechanics
**None in the traditional sense.** Runs end when oxygen runs out or ship dies. Permanent upgrades persist. After campaign (15 waves), **Endless Mode** unlocks. This is the extent of the "prestige" — a harder mode with scaling enemy stats.

Endless mode is criticized for relying on stat inflation (more asteroid health/quantity) rather than new enemy behaviors.

### Automation Unlock Path
1. All manual — pilot ship, aim, shoot, dodge
2. Better weapons → more efficient asteroid clearing
3. **Mothership upgrades** → automated tower fires at enemies
4. **Auto-laser** → significantly reduces active play requirement
5. Endless mode — full automation not really possible; active play still needed

Automation never fully replaces active play. The game remains a shooter with incremental permanent upgrades, not a true idle game.

### UI Layout
- Top-down shooter view — ship in center, asteroids/enemies all around
- HUD: health bar, oxygen bar, gem count, wave number
- Between-wave shop screen for upgrade tree navigation
- Mothership visible in center of map
- Upgrade tree shown as a skill-board with connected nodes
- Minor UI criticism: upgrades can drift off-screen edges, some tooltips unreadable

### What Makes It "Fun" / The Hook
- **Asteroids nostalgia** — familiar retro shooter feeling
- **Meaningful upgrade decisions** — oxygen vs firepower vs mothership creates real tension
- **Mothership arc** — goes from useless to essential, giving satisfying long-term payoff
- **Short session friendly** — 10-15 minute runs, quick dopamine cycles
- **Tactile damage** — ship visually degrades, adds immersion
- **"Just one more go"** loop — runs are short enough to feel low-commitment

### Estimated Complexity to Implement
**Medium (5/10).** Key challenges:
- Top-down shooter physics (collision, projectiles)
- Asteroid destruction with resource drops
- Run-state management (oxygen timer, health, waves)
- Branching permanent upgrade tree
- Mothership AI targeting and upgrade scaling
- Endless mode wave generation
- Visual ship damage rendering

---

## Cross-Game Patterns & Takeaways for Pack Rat

### Common Success Factors

| Factor | Gnorp | Rusty | Scritchy | Orb | Void |
|---|---|---|---|---|---|
| Physical visual units | Yes | Yes | No | Yes | Yes |
| Satisfying particle/visual feedback | Yes | Yes | Yes | Yes | Yes |
| Automation as a reward | Yes | Yes | Yes | Yes | Yes |
| Runs/restart structure | Yes | No | Yes | No | Yes |
| Prestige system | Yes | No | Yes | No | No |
| Short session friendly | No | Yes | Yes | Yes | Yes |
| Definite ending | Yes | No | No | Yes | Yes |
| Low price ($4-8) | Yes | Yes | Yes | Yes | Yes |
| Solo dev | Yes | Yes | No | Yes | Yes |

### Key Design Insights for Pack Rat

1. **Physical simulation > abstract numbers.** Every successful game shows units on screen doing things. Pack Rat should show the rat carrying objects, building the nest, hoarding items. Don't just show numbers going up.

2. **Automation is the reward loop.** The shift from active to passive is the most satisfying moment in every game. Plan the automation unlock path carefully — each tier should feel earned.

3. **Prestige is optional, not mandatory.** Gnorp and Scritchy use it well. Orb and Rusty succeed without it. If Pack Rat has prestige, it should be run-defining (like Gnorp's Zybellium), not just a multiplier treadmill.

4. **Definite endings respect player time.** All Hail the Orb and Gnorp both prove that incremental games with endings are appreciated. Pack Rat should have a clear "nest complete" state.

5. **Screen clutter is a real problem.** Multiple reviewers mentioned performance drops and notification fatigue. Pack Rat needs clean, non-intrusive UI.

6. **Cheap price + high conversion > expensive + low volume.** Void Miner's $4 price point drove 29K sales. The $6.99 sweet spot works across every game here.

7. **One novel interaction mechanic carries the game.** Scritchy's scratching, Gnorp's gnorp simulation, Rusty's desktop overlay, Orb's hold-to-click. Pack Rat needs its own novel hook.

8. **Upgrade synergy > upgrade quantity.** Gnorp's talent board with cross-build interactions creates more depth than Void Miner's flat permanent tree. Design upgrades that change behavior, not just multiply numbers.

9. **Trap/risk mechanics add depth.** Scritchy's partial-reveal penalty, Gnorp's rock vacuum, Void Miner's oxygen timer. Pack Rat should have some form of interesting failure state or resource constraint.

10. **Visual spectacle scales with progression.** Gnorp starts with a few gnorps and ends with thousands of particles. The visual chaos IS the endgame reward. Plan Pack Rat's visual density crescendo.

### Direct Applicability to Pack Rat

| Game | What to Steal |
|---|---|
| Gnorp Apologue | Individual rat simulation, behavior-changing upgrades, build synergy, compression/prestige loop |
| Rusty's Retirement | Desktop companion mode, cozy aesthetics, zero-pressure pacing, screen-as-resource |
| Scritchy Scratchy | Novel interaction (dragging/scavenging), risk/reward peek mechanic, automated assistant |
| All Hail the Orb | Room-unlock-as-content-gate, no-fail design, respecting player time, hold-to-click |
| Void Miner | Permanent meta-progression tree, resource-as-timer (oxygen = attic space?), short-run loop |
