# Steamworks Integration with Godot 4 — Pack Rat

## Overview

This document covers everything needed to integrate Valve's Steamworks SDK into a Godot 4 project using the community-maintained **GodotSteam** library. Based on research from official docs, community tutorials, and real shipping experience.

---

## 1. GodotSteam: Module vs GDExtension

GodotSteam (by Gramps/CoaguCo) is the primary Steamworks binding for Godot. It comes in two flavors:

### A. GDExtension (Recommended for Godot 4.4+)

- **No Godot recompilation needed** — just drop the plugin into `addons/`
- Works with standard Godot 4.4+ editor (no custom binary required)
- Available as a pre-compiled zip from the [Godot Asset Library](https://godotengine.org/asset-library/asset/2445) or [Codeberg Releases](https://codeberg.org/godotsteam/godotsteam/releases)
- Supports Windows 32/64-bit, Linux 32/64-bit/ARM64, Android ARM64, and Mac universal
- **Install:** unzip into project root, restart editor. The `Steam` singleton is immediately available.
- Do **not** use GodotSteam export templates — use normal Godot templates instead
- Current stable: v4.20.1 (Steamworks SDK 1.64, Jul 2026)

### B. Module (Pre-compiled Editor)

- Requires replacing your Godot editor with a GodotSteam-enabled build
- Steam API functions are compiled directly into the engine binary
- Must also use GodotSteam export templates for shipping
- More setup overhead; only needed if you cannot use GDExtension (e.g. Godot < 4.4)

**Recommendation:** Use GDExtension. It's simpler, doesn't require a custom editor, and is the actively maintained path for Godot 4.

---

## 2. Steamworks Account Registration

### Step-by-Step

1. **Create/pick a Steam account** — preferably a fresh dedicated publisher account (not your personal gaming account). New accounts must have at least $5 USD spent to be unrestricted.
2. **Go to [partner.steamgames.com](https://partner.steamgames.com)** and sign in.
3. **Complete digital paperwork:**
   - Legal name / company name (can be your own name as a sole proprietor)
   - Bank info (for payouts; name must match your legal name)
   - Tax info (W-9 for US, W-8BEN for non-US treaty countries). Verification takes 2-7 business days.
   - Sign the NDA and Steam Distribution Agreement
4. **Pay the $100 app fee** per game (see section 10).
5. **30-day waiting period** before you can release your first title.

### Notes

- You do not need a formal LLC — individuals can publish under their own name.
- Changing legal entity later requires transferring apps to a new partner account; plan ahead.
- Store page review by Valve takes 1-5 business days after submission.

---

## 3. Creating a New App on Steamworks

1. **Steamworks Dashboard** → **Apps & Packages** → **Create New App**
2. Enter your game name — Valve assigns an **AppID** (save this everywhere)
3. **Configure:**
   - Default language
   - Supported OS (Windows, Linux, Mac)
   - Content descriptors (age ratings)
   - Release date (set to "Coming Soon" initially)
4. **Download the Steamworks SDK** from Steamworks → SDK
5. **Set up packages & depots** (see section 5)

---

## 4. GodotSteam Integration Setup

### Installation (GDExtension)

1. Download the latest `godotsteam-*-gdextension-plugin-4.4.zip` from [Releases](https://codeberg.org/godotsteam/godotsteam/releases)
2. Extract contents into your Godot project root. The `addons/godotsteam/` folder and `.gdextension` file will be placed automatically.
3. Restart the Godot editor. The `Steam` singleton is now available globally.
4. **Optional:** Enable the plugin in Project Settings → Plugins (this only enables the Steamworks dock UI, not functionality).

### Initialize Steam

Create an autoload singleton (e.g. `SteamManager.gd`):

```gdscript
extends Node

var steam_running: bool = false

func _ready() -> void:
    var init_response: Dictionary = Steam.steamInitEx()
    print("Steam init: %s" % init_response)

    if init_response["status"] > Steam.STEAM_API_INIT_RESULT_OK:
        push_warning("Steam failed to initialize: %s" % init_response["verbal"])
        return

    steam_running = true
    print("Steam initialized. User: %s" % Steam.getPersonaName())

func _process(_delta: float) -> void:
    if steam_running:
        Steam.run_callbacks()
```

### steam_appid.txt (Development Only)

During development, Steam needs to know which app to initialize. Create `steam_appid.txt` in your project root with just the AppID number (e.g. `480` for testing with SpaceWar). **Do not ship this file.**

Alternatively, set the AppID via Project Settings → Steam → Initialization, or via `OS.set_environment("SteamAppId", str(YOUR_APP_ID))` in `_init()`.

### Callbacks

`Steam.run_callbacks()` must be called every frame — this is non-negotiable. Without it, achievements, stats, leaderboards, and overlay events will not fire.

---

## 5. Depot Setup and Build Pipeline

### SteamPipe / Depot Concepts

- **Depot:** A bucket of files for one OS/DLC slice. Each platform (Windows, Linux, Mac) gets its own depot.
- **Package:** What players install — assembled from one or more depots.
- **Build:** An uploaded snapshot of depot contents.
- **Branch:** A named set of builds (default, beta, etc.). The **default branch** is what most players receive.
- **SteamCMD:** Command-line tool for uploading builds.

### Creating Depots

1. Steamworks → Apps & Packages → SteamPipe → Depots → **Add Depot**
2. Create separate depots for Windows, Linux, macOS
3. Note the **DepotID** for each
4. Assign depots to packages under SteamPipe → Packages

### Build Upload with SteamCMD

Core VDF structure:

**`app_build.vdf`:**
```
"appbuild"
{
    "appid" "YOUR_APP_ID"
    "desc" "v1.0.0 release"
    "buildoutput" "../output/"
    "contentroot" "../builds/"
    "setlive" "default"
    "depots"
    {
        "WINDOWS_DEPOT_ID" "depot_build_windows.vdf"
        "LINUX_DEPOT_ID"  "depot_build_linux.vdf"
    }
}
```

**`depot_build_windows.vdf`:**
```
"DepotBuildConfig"
{
    "DepotID" "WINDOWS_DEPOT_ID"
    "ContentRoot" "windows/"
    "FileMapping"
    {
        "LocalPath" "*"
        "DepotPath" "."
        "recursive" "1"
    }
}
```

Upload command:
```
steamcmd +login YOUR_USERNAME +run_app_build app_build.vdf +quit
```

### CI/CD Pipeline

- Use GitHub Actions (or similar) to export Godot builds and upload via SteamCMD
- Example action steps: checkout → export Windows/Linux → upload with steamcmd
- Store Steam credentials as encrypted secrets
- Some community repos ([wj_build](https://github.com/A-Frogs-Pond/wj_build)) provide Python-based automation scripts

### Best Practices

- Upload to a **beta branch** first, test via Steam client, then promote to default
- Keep a spreadsheet tracking build ID, git commit, export profile, and depot IDs
- Never advance default branch without a cold install test from Steam
- Godot export preset names should mirror Steam branch naming in docs

---

## 6. Achievements and Stats API

### Steamworks Setup

1. Steamworks → App Admin → Stats & Achievements
2. Define each stat (INT/Float) and achievement (API name, display name, description, icon 64x64 + 32x32 PNG)
3. **Publish changes** — they must be published before the API will recognize them

### GDScript Implementation

```gdscript
var achievements: Dictionary = {
    "ACH_FIRST_JUMP": false,
    "ACH_COLLECT_100": false
}
var statistics: Dictionary = {
    "jumps": 0,
    "items_collected": 0
}

func load_stats() -> void:
    for stat in statistics.keys():
        statistics[stat] = Steam.getStatInt(stat)
    for ach in achievements.keys():
        var result = Steam.getAchievement(ach)
        achievements[ach] = result["achieved"] if result["ret"] else false

func unlock_achievement(api_name: String) -> void:
    if achievements.has(api_name) and not achievements[api_name]:
        Steam.setAchievement(api_name)
        Steam.storeStats()
        achievements[api_name] = true

func set_stat(stat_name: String, value: int) -> void:
    statistics[stat_name] = value
    Steam.setStatInt(stat_name, value)
    Steam.storeStats()
```

### Key Notes

- `storeStats()` is rate-limited (max 10 calls per 10 minutes) — batch updates before calling
- Call `storeStats()` on game exit or at natural save points, not every frame
- Stats can be "increment only" — setting a lower value will return `false`
- Use `Steam.resetAllStats(true)` for testing (true = also resets achievements)
- Achievements must be **published** in Steamworks before they work — *publishing is not the same as releasing the game*

---

## 7. Steam Cloud Saves

### Two Approaches

**A. Steam Auto-Cloud** (simpler):
- Save files normally to `user://` — Steam syncs them automatically
- Works out of the box once Cloud is enabled in Steamworks
- You must configure save file paths in Steamworks → App Admin → Steam Cloud

**B. Steam Cloud API** (manual):
- Use `Steam.fileWrite()`, `Steam.fileRead()`, `Steam.fileExists()` from `ISteamRemoteStorage`
- More control but more code

### Dynamic Cloud Sync

Handles the Steam Deck suspend/resume scenario (game is running but cloud changes come from another device):

```gdscript
# In _ready():
Steam.local_file_changed.connect(_on_cloud_file_changed)

# Wrap saves:
Steam.beginFileWriteBatch()
# ... do save ...
Steam.endFileWriteBatch()

func _on_cloud_file_changed(file_name: String, change_type: int) -> void:
    match change_type:
        Steam.LOCAL_FILE_CHANGE_FILE_UPDATED:
            # Reload save data
            pass
        Steam.LOCAL_FILE_CHANGE_FILE_DELETED:
            # Handle deletion
            pass
```

Enable this in Steamworks → App Admin → Configure Cloud Saves → check "Enable Steam Cloud sync on system suspend and resume".

### Community Tools

- [godot-steam-cloud](https://github.com/softwoolco/godot-steam-cloud) — wrapper for Resource + ISteamRemoteStorage
- Set up root overwrite paths in Steamworks for Mac builds (e.g. `Contents/Resources/`)

---

## 8. Steam DRM

### Options

1. **CEG (Custom Executable Generation):** Valve's DRM wrapper. Encrypts the executable; only decrypted by the Steam client at launch.
2. **No DRM:** Steam is already a commercial incentive against piracy — many indie games launch without additional DRM.
3. **Other 3rd party:** Denuvo, etc. (expensive, overkill for most indies)

### Recommendation for Pack Rat

Start without DRM. Steam's own anti-piracy (app ownership check via `Steam.isSubscribed()`) and the convenience of auto-updates is enough. DRM can always be added later if needed, but it's another thing that can break.

---

## 9. Steam Leaderboards

### Steamworks Setup

Steamworks → App Admin → Stats & Achievements → Leaderboards → Add Leaderboard
- Unique API name (use underscores, not dashes — dashes can cause failures)
- Sort order (ascending/descending)
- Display type (numeric or time)
- **Publish** after adding

### GDScript Implementation

```gdscript
var leaderboard_handles: Dictionary = {
    "high_scores": 0,
    "fastest_times": 0
}

func find_leaderboards() -> void:
    Steam.leaderboard_find_result.connect(_on_leaderboard_found)
    for lb in leaderboard_handles.keys():
        Steam.findLeaderboard(lb)

func _on_leaderboard_found(handle: int, found: int) -> void:
    if found == 1:
        var name: String = Steam.getLeaderboardName(handle)
        leaderboard_handles[name] = handle

func submit_score(lb_name: String, score: int) -> void:
    var handle = leaderboard_handles.get(lb_name, 0)
    if handle == 0:
        return
    Steam.uploadLeaderboardScore(score, Steam.LEADERBOARD_UPLOAD_METHOD_KEEP_BEST, handle)

func download_scores(lb_name: String, start: int, end: int) -> void:
    var handle = leaderboard_handles.get(lb_name, 0)
    if handle == 0:
        return
    Steam.downloadLeaderboardEntries(start, end, Steam.LEADERBOARD_DATA_REQUEST_GLOBAL, handle)
```

### Callbacks

- `leaderboard_score_uploaded` — returns success, handle, score dict (new_rank, prev_rank, etc.)
- `leaderboard_scores_downloaded` — returns status message, handle, array of entry dicts
- Each entry: `{score, steam_id, global_rank, ugc_handle, details}`

### Rate Limits

Uploading scores is rate-limited to 10 per 10 minutes. Only one outstanding upload call at a time.

---

## 10. The $100 App Deposit Fee

### Details

- **Cost:** $100 USD per game (or equivalent in local currency with VAT/GST where applicable)
- **When:** Paid during Steamworks onboarding, or when creating a new app as an existing dev
- **Payment:** Any method Steam supports (excluding Steam wallet)
- **Recoupable:** Yes — refunded after the game generates $1,000 Adjusted Gross Revenue
  - Appears as a separate line item in monthly payment reports
  - Refund comes from revenue, not as a direct return
- **Non-refundable** if the game never earns $1k
- **Tax:** VAT/GST may apply depending on region; invoice issued to the individual who paid
- **Note:** If the app fee payment is charged back or reversed, revenue may be withheld

### Budget Consideration

For Pack Rat, budget $100 per Steam app. If you plan a demo + full game as separate apps, that's $200. However, Valve recommends demos via the main app (not a separate app) to avoid extra fees.

---

## 11. Testing Steam Integration Before Release

### Development Testing

1. **`steam_appid.txt`** — place AppID in project root for local testing
2. **SpaceWar (AppID 480)** — use Valve's test app for initial development before your AppID is set up
3. **Separate testing account** — test achievements and leaderboards on an alt Steam account to avoid polluting your dev account data
4. **`Steam.resetAllStats(true)`** — call during testing to reset achievements/stats

### Pre-Release Testing Checklist

- [ ] Achievements unlock and display overlay popup
- [ ] Stats increment correctly and persist across restarts
- [ ] Leaderboards show scores and rankings
- [ ] Cloud saves sync between devices (test with two machines)
- [ ] Dynamic Cloud Sync works on Steam Deck / suspend-resume
- [ ] Steam overlay works (Shift+Tab)
- [ ] `steam_appid.txt` is **NOT** included in the shipped build
- [ ] Exported game launches correctly from Steam client (cold install from beta branch)
- [ ] Game behaves gracefully when Steam isn't running (`steamInitEx` failure path)

### Beta Branch Testing

1. Upload build to a password-protected beta branch
2. Distribute password to testers
3. Test via Steam client as a "fresh install"
4. When verified, promote build to default branch

---

## 12. Common Pitfalls for First-Time Steam Publishers

1. **Forgetting `run_callbacks()`** — the #1 cause of "my achievements don't work." Must be in `_process()`.

2. **Not publishing Steamworks changes** — achievements/stats/leaderboards must be explicitly *Published* in the Steamworks backend before the API recognizes them. This is separate from releasing the game.

3. **Not calling `storeStats()`** — `setAchievement()` and `setStatInt()` only set local values. `storeStats()` actually persists them to Steam.

4. **Mixing Module and GDExtension** — using pre-compiled editor AND the GDExtension plugin simultaneously causes duplicate calls and errors. Pick one.

5. **Including `steam_appid.txt` in shipped builds** — this file is for development only. Remove it before building your Steam depot.

6. **Using dashes in leaderboard names** — use underscores instead; dashes can silently break leaderboard lookups.

7. **Overlay not working in Forward+/Vulkan** — overlay may not work in editor or standalone builds, but will work when launched through Steam client. Use Compatibility/OpenGL rendering if overlay is critical during dev.

8. **Wrong depot assigned to wrong branch** — always verify the build ID matches what you tested before promoting to default.

9. **Forgetting the 30-day waiting period** — first-time publishers must wait 30 days after paying the app fee before releasing. Plan your launch timeline accordingly.

10. **Store page submitted too late** — Valve reviews store pages, which can take 1-5 business days. Submit your store page **weeks** before your planned launch date.

11. **Pricing not set in all regions** — Steam requires pricing in all supported regions. Use Steam's suggested pricing tool to auto-generate regional prices.

12. **Achievements not syncing with SDK 1.61+** — as of SDK 1.61, `requestCurrentStats()` and `current_stats_received` no longer exist. Stats sync automatically on init.

13. **No graceful fallback when Steam isn't running** — always handle the case where `steamInitEx()` fails (e.g. player is offline, or using a non-Steam build). Disable Steam features gracefully, don't crash.

---

## Resources

- **GodotSteam Home:** https://godotsteam.com
- **GodotSteam Codeberg:** https://codeberg.org/godotsteam/godotsteam
- **GodotSteam GDExtension Releases:** https://codeberg.org/godotsteam/godotsteam/releases
- **Godot Asset Library (GDExtension):** https://godotengine.org/asset-library/asset/2445
- **Steamworks Partner Portal:** https://partner.steamgames.com
- **Steamworks SDK Docs:** https://partner.steamgames.com/doc/home
- **Steam Direct Fee Info:** https://partner.steamgames.com/doc/gettingstarted/appfee
- **Onboarding Guide:** https://partner.steamgames.com/doc/gettingstarted/onboarding
- **Example Project (Skillet):** https://codeberg.org/godotsteam/skillet
- **Shipping Guide (teamwoolard):** https://teamwoolard.com/walkthroughs/steam-publishing.html
- **Depot/Branch Guide (GamineAI):** https://www.gamineai.com/blog/steam-depots-beta-branches-default-build-discipline-unity-godot-small-teams-2026
