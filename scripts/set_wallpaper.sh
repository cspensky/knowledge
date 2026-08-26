#!/usr/bin/env bash
# Set the desktop wallpaper to the Allthenticate logo.
#
# Deliberately a different shade from the lock screen (see lock_and_blur.sh) so
# a glance tells you whether the session is actually locked.
set -euo pipefail

BG='#1b2430'        # lighter than the lock screen's #0d1117
LOGO_TINT='#33445a' # muted, so the desktop stays quiet behind windows
LOGO_FRAC=0.18

img=$("$(dirname "$(readlink -f "$0")")/allthenticate_bg.sh" "$BG" "$LOGO_TINT" "$LOGO_FRAC")

# --bg-tile, not --bg-center: the image is already exactly root-sized, so
# tiling maps it 1:1 from the origin and every monitor gets its own logo.
# --bg-center would instead centre it on the combined root window.
exec feh --bg-tile "$img"
