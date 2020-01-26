#!/bin/bash
if [ "$(sudo systemctl status tor | grep dead)" ]
then 
	sudo systemctl start tor && notify-send "TOR" "Tor started successfully" || notify-send "TOR" "Tor accounted an error while starting"
else 
	sudo systemctl stop tor && notify-send "TOR" "Tor stopped successfully" || notify-send "TOR" "Tor accounted an error while stopping"
fi
