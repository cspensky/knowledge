#!/usr/bin/env bash
# Compose (and cache) a root-window-sized image with the Allthenticate logo
# centred on each monitor, and print the path to it.
#
# Centring per monitor matters: i3lock and feh both treat the combined root
# window as one canvas, so a single centred logo would land on a monitor seam
# and leave the other outputs empty.
#
# usage: allthenticate_bg.sh <bg-colour> <logo-colour|none> <logo-fraction>
set -euo pipefail

BG=${1:?bg colour required}
LOGO_TINT=${2:?logo colour required}
LOGO_FRAC=${3:?logo fraction required}

LOGO="$HOME/.local/share/allthenticate/logo.png"
CACHE_DIR="$HOME/.cache/allthenticate-bg"

geom=$(xrandr --listmonitors | tail -n +2)
key=$(printf '%s|%s|%s|%s' "$geom" "$BG" "$LOGO_TINT" "$LOGO_FRAC" | md5sum | cut -c1-12)
img="$CACHE_DIR/bg-$key.png"

# Cached on monitor layout, so docking/undocking rebuilds once and then reuses.
if [ ! -f "$img" ]; then
    mkdir -p "$CACHE_DIR"
    # no early `exit` in awk: it would SIGPIPE xdpyinfo and `pipefail` would
    # abort the script, racily, depending on whether the output flushed first
    root=$(xdpyinfo | awk '/^  dimensions:/{d=$2} END{print d}')
    [ -n "$root" ]

    tint=()
    [ "$LOGO_TINT" = none ] || tint=(-fill "$LOGO_TINT" -colorize 100)

    args=()
    while read -r line; do
        [[ $line =~ ([0-9]+)/[0-9]+x([0-9]+)/[0-9]+\+([0-9]+)\+([0-9]+) ]] || continue
        w=${BASH_REMATCH[1]}; h=${BASH_REMATCH[2]}
        x=${BASH_REMATCH[3]}; y=${BASH_REMATCH[4]}
        short=$(( w < h ? w : h ))
        lw=$(( short * ${LOGO_FRAC#0.} / 100 ))
        args+=( \( "$LOGO" "${tint[@]}" -resize "${lw}x${lw}" \)
                -geometry "+$(( x + (w - lw) / 2 ))+$(( y + (h - lw) / 2 ))" -composite )
    done <<< "$geom"

    convert -size "$root" "xc:$BG" -gravity northwest "${args[@]}" -depth 8 -strip "png:$img.tmp"
    mv -f "$img.tmp" "$img"
fi

printf '%s\n' "$img"
