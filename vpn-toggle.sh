#!/bin/bash
ip=$(curl -Ss ifconfig.me)

if [ $(ps -ef | grep openvpn | wc -l) -gt 1 ]
then
	/home/adam/Scripts/vpn-stop.sh
else
	/home/adam/Scripts/vpn-start.sh
fi

sleep 5
for x in $(seq 0 5)
do 	
	newIp=$(curl -Ss ifconfig.me)
	if [ "$ip" != "$newIp" ]
	then
		pkill -RTMIN+14 i3blocks
		exit
	fi
	sleep 2
done
