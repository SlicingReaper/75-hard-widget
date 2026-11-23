#!/bin/bash
# 75//HARD installer — double-click in Finder (first time: right-click → Open), or run: bash install.command
# Safe to run again: it updates the code and never touches your data.
D="$(cd "$(dirname "$0")" && pwd)"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:$PATH"
SUP="$HOME/Library/Application Support/STUDYTERM"; SA="$SUP/standalone"
pause() { [ -n "$NOPAUSE" ] || read -r -p "Press Enter to close"; }
die() { echo "✗ $*"; pause; exit 1; }
APP="$(ls -d /Applications/*bersicht.app 2>/dev/null | head -1)"
if [ -z "$APP" ]; then
  echo "… Übersicht not found, downloading it"
  curl -fL --retry 2 -o /tmp/uebersicht.zip "https://tracesof.net/uebersicht/releases/Uebersicht-1.6.82.app.zip" \
    && ditto -x -k /tmp/uebersicht.zip /Applications && rm -f /tmp/uebersicht.zip
  APP="$(ls -d /Applications/*bersicht.app 2>/dev/null | head -1)"
  [ -n "$APP" ] && xattr -dr com.apple.quarantine "$APP" 2>/dev/null
fi
[ -n "$APP" ] || die "Übersicht install failed — get it from https://tracesof.net/uebersicht/ and run this again"
[ -d "$HOME/Library/Application Support/Übersicht/widgets" ] || { open -g "$APP"; sleep 5; }
W="$(ls -d "$HOME/Library/Application Support/"*bersicht/widgets 2>/dev/null | head -1)"
[ -n "$W" ] || W="$HOME/Library/Application Support/Übersicht/widgets"; mkdir -p "$W"
python3 -c "import sys; assert sys.version_info >= (3, 8)" 2>/dev/null || die "python3 3.8+ missing — run: xcode-select --install   then run this again"
grep -qs "Obsidian Vault" "$W/75hard.jsx" && { read -r -p "$W/75hard.jsx is the OBSIDIAN edition. Replace it with the standalone one? [y/N] " a; [ "$a" = y ] || [ "$a" = Y ] || { echo "Nothing changed."; pause; exit 0; }; }
mkdir -p "$SA/bin" "$SA/data"
cp "$D/hard75.py" "$SA/bin/" && python3 "$SA/bin/hard75.py" state >/dev/null && echo "✓ hard75.py → $SA/bin" || die "hard75.py failed"
cp "$D/75hard.jsx" "$W/" && echo "✓ 75hard.jsx → $W" || die "copy failed"
open -g "$APP"; sleep 1; osascript -e 'tell application id "tracesOf.Uebersicht" to refresh' 2>/dev/null
echo "== 75//HARD installed. Click it to use it. If clicks fall through: Übersicht menu-bar icon → 75hard.jsx → interaction on."
pause
