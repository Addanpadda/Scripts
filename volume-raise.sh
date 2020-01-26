#!/bin/bash
if pactl set-sink-volume $(pacmd list-sinks | grep "*" | awk '{print $3}') +2%
then
	/home/adam/Scripts/volume-notify.sh
else
	notify-send "Volume" "Error when raising volume"
fi

# Dwm
#killall status-bar.sh && /home/adam/Scripts/status-bar.sh &
