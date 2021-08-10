#!/usr/bin/env bash

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/projects/knowledge/scripts/lock-icon.png"
tmpbg='/tmp/screen.png'



# take a screenshot
scrot "$tmpbg"

# darken
convert -brightness-contrast -60x20 "$tmpbg" "$tmpbg"

# blur the screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"

# overlay the icon onto the screenshot
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
i3lock -i "$tmpbg"

REMOTE_HOST="169.254.1.2"
ssh $REMOTE_HOST "pmset displaysleepnow"
