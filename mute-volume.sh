#!/bin/bash
pactl set-sink-mute $(pacmd list-sinks | grep "*" | awk '{print $3}') toggle && killall status-bar.sh && /home/adam/Scripts/status-bar.sh &
