#!/bin/bash
EXTERNAL_OUTPUT="HDMI1"
EXTERNAL_OUTPUT2="DP1-1"
EXTERNAL_OUTPUT3="DP1"
EXTERNAL_OUTPUT4="DP2"
INTERNAL_OUTPUT="eDP1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="ALL"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "ALL" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT2 --auto
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT3 --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT2 --off
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT3 --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="WTF"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT2 --auto --same-as $INTERNAL_OUTPUT
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT3 --auto --same-as $INTERNAL_OUTPUT
elif [ $monitor_mode = "WTF" ]; then
        monitor_mode="CLONES"
	xrandr --output $EXTERNAL_OUTPUT --rotate right --primary --output $EXTERNAL_OUTPUT4 --auto --rotate left --left-of $EXTERNAL_OUTPUT --output $INTERNAL_OUTPUT --off
else
        monitor_mode="ALL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT2 --auto --left-of $INTERNAL_OUTPUT
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT3 --auto --left-of $INTERNAL_OUTPUT
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat

notify-send -i monitor-mode "Monitor mode" "Current mode: ${monitor_mode}"
