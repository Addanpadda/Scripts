#!/bin/bash

if [ -f /tmp/i3-focus-mode ]; then
	rm /tmp/i3-focus-mode
	i3-msg restart
	/home/adam/Scripts/backgrounds.sh	
else
	touch /tmp/i3-focus-mode
	
	# Reconfigure i3 for focus
	i3-msg "bar mode invisible"
	i3-msg "gaps inner all set 0"
	i3-msg "gaps outer all set 0"
	killall backgrounds.sh
	feh --bg-scale /home/adam/Pictures/work-wallpaper.jpg
fi
