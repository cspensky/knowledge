#!/usr/bin/env bash
# Allthenticate lock screen.
#
# Invoked by xss-lock (see the i3 config), which must own the i3lock process:
# sda-service unlocks by calling logind's UnlockSessions(), and xss-lock is the
# only thing listening for that -- it responds by killing the locker it started.
# Hence `exec` below (i3lock inherits this pid) and `-n` (never fork away from
# it). Break either and the phone can no longer dismiss the lock screen, and
# logind's LockedHint goes stale so SDA reports the wrong lock state.
set -euo pipefail

BG='#0d1117'
LOGO_TINT='white'
LOGO_FRAC=0.22

img=$("$(dirname "$(readlink -f "$0")")/allthenticate_bg.sh" "$BG" "$LOGO_TINT" "$LOGO_FRAC" 2>/dev/null) || img=

# Always lock, even if composing the image failed -- falling through to no lock
# at all would be a security hole.
if [ -n "$img" ] && [ -f "$img" ]; then
    exec i3lock -n -i "$img"
else
    exec i3lock -n -c "${BG#\#}"
fi
