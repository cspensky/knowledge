#!/bin/bash
EXTERNAL_OUTPUT="HDMI1"
EXTERNAL_OUTPUT2="DP1-1"
INTERNAL_OUTPUT="eDP1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT2 --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT2 --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT2 --auto --same-as $INTERNAL_OUTPUT
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT2 --auto --left-of $INTERNAL_OUTPUT
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat

notify-send -i monitor-mode "Monitor mode" "Current mode: ${monitor_mode}"
