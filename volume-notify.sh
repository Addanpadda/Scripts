#!/bin/bash
vol=$(/home/adam/Scripts/volume-get.sh)

killall dunst
if [ $vol == MUTED ]
then
	notify-send "Volume" "$vol ($(pacmd list-sinks | grep "*" -A 11 | grep volume | awk 'NR == 1 {print $5}'))"
else
	notify-send "Volume" "$vol"
fi
pkill -RTMIN+10 i3blocks
