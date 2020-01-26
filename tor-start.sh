#!/bin/bash
if [ "$(sudo systemctl status tor | grep dead)" ]
then 
	sudo systemctl start tor && notify-send "TOR" "Tor started successfully" || notify-send "TOR" "Tor accounted an error while starting" && pkill -RTMIN+12 i3blocks
fi
