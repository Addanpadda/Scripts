#!/bin/bash
pactl set-sink-volume $(pacmd list-sinks | grep "*" | awk '{print $3}') -2% && killall status-bar.sh && /home/adam/Scripts/status-bar.sh &
