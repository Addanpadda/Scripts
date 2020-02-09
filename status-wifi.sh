#!/bin/bash
if [ "$(ip route)" ]
then
	ip="$(ip addr show dev wlp3s0 | grep inet | awk 'NR == 1 {print $2}' | cut -d/ -f1)"
	if [ ! $(echo $ip | grep :) ]
	then
		echo -e "📶 $ip\n\n#00ff00"
		exit
	fi
fi

echo -e "NO WIFI\n\n#ff0000"
# Refresh script faster
sleep 0.5
pkill -RTMIN+10 i3blocks
