# 🔥 75//HARD — 75 Hard challenge tracker

![macOS](https://img.shields.io/badge/macOS-Übersicht-3ef0ff?style=flat-square&logo=apple&logoColor=white&labelColor=040914) ![Vibecoded](https://img.shields.io/badge/vibecoded-with%20Claude-ff5ad9?style=flat-square&labelColor=040914)

The 75 Hard checklist on your desktop: do all seven tasks every day for 75 days. Miss one and you start again at Day 1.

| File | What |
|:--|:--|
| `75hard.jsx` | The widget (230 × 314, under the wallet by default) |
| `hard75.py` | Backend: stdlib Python, works out the day count and whether the attempt is still alive |
| `obsidian/` | My original edition, which reads and writes my Obsidian vault ([details](obsidian)) |

## Use it

1. **Tap the bottom line** (`▶ TAP HERE TO START DAY 1`): today becomes Day 1.
2. **Tap a task** to tick it. Tap again to untick it. You can only tick *today*.
3. Tick all seven → `DAY COMPLETE ■`.

If any earlier day of the attempt isn't fully ticked, the attempt has **failed**. The widget turns red and shows which day you missed. Tap the bottom line twice to restart. After Day 75 it shows **FINISHED**, and the same double tap starts a new attempt. Old attempts are kept in the file's `history`.

Days roll over at **04:00**, so ticking at 01:00 still counts for the day before.

## Change the tasks

Default: outdoor workout 45 · second workout 45 · 3.8 L water · 10 pages · progress photo · follow the diet · no alcohol / cheat meal. Edit `"tasks"` in the data file to change them; any number of tasks works:

```json
"tasks": [ { "icon": "🏃", "label": "OUTDOOR WORKOUT 45" }, { "icon": "📖", "label": "10 PAGES" } ]
```

## Data

`~/Library/Application Support/STUDYTERM/standalone/data/hard75.json`: `start` (Day 1), `attempt`, `ticks` (date → ticked task numbers), `history`, `tasks`.

## 🚀 Install

1. Download this repo (green **Code** button → *Download ZIP*) and double-click **`install.command`**. The first time, macOS may block it: right-click → *Open*.
   It installs [Übersicht](https://tracesof.net/uebersicht/) if you don't have it and copies `75hard.jsx` into its widgets folder, plus `hard75.py` into `~/Library/Application Support/STUDYTERM/standalone/bin/`.
2. Click the widget to use it. If clicks fall through to the desktop: Übersicht menu-bar icon → this widget → turn on interaction.

- **Needs:** macOS 13+ · `python3` 3.8+ (run `xcode-select --install` if you don't have it)
- **By hand:** Copy `75hard.jsx` into Übersicht's widgets folder (menu-bar icon → *Open Widgets Folder*) and `hard75.py` into `~/Library/Application Support/STUDYTERM/standalone/bin/`.
- **Remove:** delete `75hard.jsx` from the widgets folder. Your data in `~/Library/Application Support/STUDYTERM/standalone/data/` stays.

## 🎨 Look and position

Out of the box it sits in its default spot in the cyan terminal theme. Install [**WIDGET//CTL**](https://github.com/SlicingReaper/widgetctl) to drag it anywhere on a grid and pick from 16 colour schemes × 8 styles, and to get `⌃⌥⌘W`, which hides all widgets at once.

## 🧩 Part of a collection

This widget is one of nine that share the same retro-terminal look, the same theming and the same show/hide hotkey. Each works on its own; together they make a desktop dashboard.

| | Widget | What |
|:-:|:--|:--|
| 💰 | [**WALLET//Ð**](https://github.com/SlicingReaper/points-wallet-widget) | Points wallet: earn for habits, spend on rewards, lock savings, keep a streak |
| 🔥 | [**75//HARD**](https://github.com/SlicingReaper/75-hard-widget) ← you are here | 75 Hard challenge tracker: 7 daily tasks, day counter, auto-fail on a missed day |
| ⏱️ | [**STUDY//TERM**](https://github.com/SlicingReaper/study-timer-widget) | Study stopwatch that logs what you did, with a stats page and points |
| ✎ | [**NOTE//PAD**](https://github.com/SlicingReaper/notepad-widget) | Checklist notes with deadline countdowns, auto-expiry and a bin |
| “ | [**QUOTE//DAY**](https://github.com/SlicingReaper/quote-of-the-day-widget) | A new quote every midnight from a pool of 300, with likes and your own quotes |
| ▦ | [**TETRIS//GRID**](https://github.com/SlicingReaper/tetris-widget) | Tetris on the desktop: hold, ghost piece, levels, best score |
| ◉ | [**PONG//SOLO**](https://github.com/SlicingReaper/pong-widget) | Single-player Pong: keep the ball up, it speeds up every hit |
| ⊞ | [**2048//TILE**](https://github.com/SlicingReaper/2048-widget) | 2048 with undo, keyboard or drag, saved between sessions |
| 🎛️ | [**WIDGET//CTL**](https://github.com/SlicingReaper/widgetctl) | Menu-bar app that arranges and themes all the widgets, plus a ⌃⌥⌘W show/hide hotkey |

**Install all of them at once:** [`vibecoded` → install-all.command](https://github.com/SlicingReaper/vibecoded) · 🤖 Vibecoded with [Claude](https://claude.ai): I designed, directed and tested it, the AI wrote most of the code.
