# Pixel Art Research — Pack Rat

## Free/CC0 Pixel Art Asset Sources

| Source | URL | Notes |
|--------|-----|-------|
| **OpenGameArt.org** | https://opengameart.org | Largest collection of CC0 game art. Filter by "CC0" license. |
| **Kenney.nl** | https://kenney.nl/assets | 100% CC0. Pixel Platformer, Pixel Pack, UI Pixel Adventure packs. 440+ tiles in latest platformer pack. |
| **itch.io (free bundles)** | https://itch.io/game-assets/free | Huge variety; filter by CC0. Notable: Messy Furniture Set by 0_mem0ry (32x32 top-down, dirty dishes, unkempt bed, dead plants). |
| **CraftPix** | https://craftpix.net/freebies | Free top-down interior/home sets (Main Character's Home, etc.). |
| **Lospec** | https://lospec.com | Palettes, tutorials, free web-based pixel editor, and asset lists. |
| **FreeGameSprites** | https://freegamesprites.itch.io | 97 CC0 sprites in Dungeon Pack. |

### Thematic CC0 Assets for "Attic / Junk / Indoor"

- **Messy Furniture Set** by 0_mem0ry (itch.io) — 32x32 top-down, CC0. Dirty dishes, chairs (front/back/side), open/closed drawers, dead houseplants. Great for junk-filled attic.
- **Trashville: FREE Junkyard Tileset & Sprites** by GrimyGraphix (itch.io) — platformer tileset, junk, trash, grimy atmosphere.
- **Main Character's Home** by CraftPix (free) — interior tiles, furniture, bookshelves, beds, kitchens, fireplaces. Cozy indoor.
- **Dungeon Pack** by freegamesprites (itch.io) — 97 CC0 sprites including furniture, cages, barrels, stone/cellar-like environments (adaptable to attic basement feel).
- **Kenney Pixel Platformer** — indoor environment tiles, items, crates, boxes, clutter.

### Known CC0 Rat / Rodent Sprites

| Asset | Source | License | Details |
|-------|--------|---------|---------|
| **Free Rat Pack** by Phewcumber | https://phewcumber.itch.io/rat-pack | CC0 (free, no credit needed) | Fully animated 32x32 rat. All animations on separate sprite sheets. |
| **Mouse/Rat pixel art** | https://opengameart.org/content/mouse-0 | Free/CC0 | Simple animated pixel art mouse. Idle + walking frames. |
| **Rat Enemy** by Xavier | https://rogueagency.itch.io/rat-enemy | CC (BY) | Animated rat enemy sprite. 64x64, .aseprite source included. |
| **Rodents (Rat Rework)** | https://opengameart.org/content/rodents-rat-rework | CC0 | Drop-in rat sprite, reworked from Reemax's original. |
| **Top-down rat, animated** (LPC) | https://lpc.opengameart.org/content/top-down-rat-animated | CC0 | Attack, dying, move animations from Warlock's Gauntlet. |
| **RATS!** by Micax | https://micaxx.itch.io/rats | Free (name your price) | 48x48, 4 color variants, walking/standing/dead. |
| **2D Pixel Rat Sprites** by carysaurus | https://carysaurus.itch.io/rat-sprites | Free pack (credit required) | 5 animations: Walk, Attack, Idle, Hurt, Death. 6 color variants in paid pack. |

## Free Pixel Art Tools (Alternatives to Aseprite)

| Tool | URL | Price | Notes |
|------|-----|-------|-------|
| **Pixelorama** | https://www.pixelorama.org | Free (MIT) | **Best free alternative.** Built in Godot. Layers, tilemaps (rect/iso/hex), onion skinning, non-destructive effects, palette management. Runs in browser too. Actively maintained (10k+ GH stars). |
| **LibreSprite** | https://github.com/LibreSprite/LibreSprite | Free (GPL) | Fork of old Aseprite. Same UI/shortcuts. Less active development but fully functional for basic work. |
| **Piskel** | https://www.piskelapp.com | Free | Browser-based, zero setup. No layers, but fast for quick sprites. |
| **Lospec Pixel Editor** | https://lospec.com/pixel-editor | Free | Browser-based, simple, good for quick edits. |
| **GIMP** (with pixel config) | https://www.gimp.org | Free | Needs manual setup: disable anti-aliasing, nearest-neighbor scaling, indexed color mode. Not pixel-native but capable. |
| **Krita** | https://krita.org | Free | Has pixel art mode with indexed color and pixel brushes. Better if you already use it for illustration. |

**Recommendation:** Use **Pixelorama** as primary editor (open source, actively maintained, Godot-native). Keep Piskel or Lospec Editor for quick browser edits.

## Color Palette Recommendations (Cozy Attic / Warm Tones)

### HoneyGB (4-color, warm cozy GB-style)
- `#3e3a42` (dark purple-brown)
- `#877286` (muted mauve)
- `#f0b695` (warm peach)
- `#e9f5da` (cream)

Perfect for a warm, cozy GameBoy-style aesthetic. Very limited — good for tight constraint design.

### Caramel Pixel Latte (5-color, cozy interior)
- `#2b1d14` (deep roast / outlines)
- `#6f4e37` (coffee brown)
- `#b08968` (toasted wood)
- `#e6ccb2` (cream)
- `#fefae0` (warm white)

Ideal for attic interiors — warm lamplight, wood, dust motes.

### Sweetie 16 (16-color, warm alternative to PICO-8)
Softer, warmer, more approachable than PICO-8. Great for platformers and casual games. Used in many shipped indies.

### Cozy Adventure Palette (Lospec, 16-color)
Broad spectrum of warm hues. Fun, colorful, inviting.

### NES Palette (32-color)
Vintage 8-bit feel. Saturated primaries against deep darks. Good if targeting authentic retro constraints.

**Palette strategy for Pack Rat:**
- Base palette: **HoneyGB** or **Caramel Pixel Latte** for the warm attic feel
- Expand to **Sweetie 16** or **Cozy Adventure** for more variety in items/junk
- Keep per-sprite color count low (4-8 colors including outline)
- Warm browns, ambers, musty yellows, dark purples for shadow

## Godot Sprite Import Format: Best Practices

### Recommended Pipeline

```
Spritesheet PNG → AtlasTexture resources → SpriteFrames → AnimatedSprite2D
```

### Key Findings

1. **Use AnimatedSprite2D + SpriteFrames** for characters and animated objects. Simplest API, good performance.
2. **Use Sprite2D + AnimationPlayer** when you need to synchronize animations with other events (hitboxes, sounds, cutscenes).
3. **Prefer spritesheets over individual files.** One PNG per character/scene → fewer draw calls → better batching.
4. **Use AtlasTexture (.tres) over Sprite2D.region_rect** for anything reused across scenes. AtlasTexture resources are reusable; region_rect is per-node and baked into scene files.
5. **Set texture filter to "Nearest"** in Project Settings (and per-CanvasItem if needed) for crisp pixel art.
6. **Enable "Snap 2D Transforms to Pixel"** to prevent sub-pixel jitter on camera movement.
7. **Match SpriteFrames FPS to export FPS** (typically 10 FPS for walk, 6-8 FPS for idle).
8. **Use Power of Two texture dimensions** (256x256, 512x512, etc.) for optimal GPU memory.

### Decision Tree

| Use Case | Approach |
|----------|----------|
| Simple character animation | AnimatedSprite2D + SpriteFrames |
| Complex with sound/hitbox sync | Sprite2D + AnimationPlayer |
| Hundreds of identical instances | MultiMeshInstance2D |
| Static single sprite | Sprite2D |
| UI / HUD elements | TextureRect + AtlasTexture |

## Free Pixel Art Tutorials for Beginners

| Tutorial | Author | URL |
|----------|--------|-----|
| **Pixel Art: Where to Start** | Lospec | https://lospec.com/pixel-art-where-to-start |
| **Creating Pixel Art** | Cure (Logan Tanner) | https://lospec.com/pixel-art-tutorials/creating-pixel-art-by-cure |
| **Pixel Art Tutorial** | Derek Yu | https://lospec.com/pixel-art-tutorials/pixel-art-tutorial-by-derek-yu |
| **Absolute Beginner's Guide** | Saint11 | https://saint11.org/pixel_art_articles/article1/ |
| **Pixel Art: Complete Beginner to Pro** | Generalist Programmer | https://generalistprogrammer.com/tutorials/pixel-art-complete-tutorial-beginner-to-pro |
| **Pixel Art Basics** | Lux (Lospec) | https://lospec.com/pixel-art-tutorials/pixel-art-basics-for-beginners-programmers-and-everyone-else-by-lux |
| **YouTube: Saint11** | Saint11 | Pixel art animation and technique deep-dives |
| **YouTube: AdamCYounis** | AdamCYounis | Godot + pixel art workflow |
| **YouTube: Pixel Art 101** | Various | Search for pixel art fundamentals |
| **Palettes: A Beginner Guide** | Lospec | https://lospec.com/pixel-art-tutorials/palettes-a-beginner-guide |

### Suggested Learning Path
1. **Start with** Lospec's "Pixel Art: Where to Start" guide
2. **Read** Saint11's Absolute Beginner Guide (covers tools, canvas sizes, palette choice)
3. **Practice** with Cure's or Derek Yu's tutorial (walk through creating a sprite)
4. **Learn palettes** via Lospec's palette guide + use HoneyGB or Caramel Pixel Latte
5. **Animate** after comfortable with static sprites (walk cycles, idle animations)
6. **Implement** in Godot following the AnimatedSprite2D + SpriteFrames pipeline

## Summary for Pack Rat Development

**Tools:** Pixelorama (primary) + Lospec Pixel Editor/Piskel (quick edits)
**Palette:** HoneyGB or Caramel Pixel Latte for warm attic feel; expand to Sweetie 16 if needed
**Godot workflow:** Spritesheet → AtlasTexture → SpriteFrames → AnimatedSprite2D
**Existing rat sprites:** Phewcumber's Free Rat Pack (CC0, full animation) is the strongest starting point
**Tilesets to adapt:** Messy Furniture Set (junk/clutter), Kenney Pixel Platformer (indoor environments)
**Canvas size:** 32x32 for characters (standard for indie pixel art), 16x16 for tiles/items
