#!/bin/bash
if pactl set-sink-mute $(pacmd list-sinks | grep "*" | awk '{print $3}') toggle 
then
	/home/adam/Scripts/volume-notify.sh
	# Dwm
	#killall status-bar.sh && /home/adam/Scripts/status-bar.sh &
else
	notify-send "Mute" "Error when muting"
fi
