#!/bin/bash
# XF86AudioStop

pactl set-source-mute  $(pacmd list-sources | grep "*" | awk '{print $3}') toggle
muted=$(pacmd list-sources | grep "*" -A 11 | grep muted | awk '{print $2}')

if [ $muted == yes ]
then
	notify-send "Microphone" "Muted"
elif [ $muted == no ]
then
	notify-send "Microphone" "Unmuted"
else
	notify-send "Microphone" "Error while checking mic mute"
fi

# Restart dwm status bar
#killall status-bar.sh && /home/adam/Scripts/status-bar.sh &
