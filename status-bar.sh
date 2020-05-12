#!/bin/bash
volUpdateInterval=1
freeRamUpdateInterval=5
ssdSpaceUpdateInterval=60
batteryUpdateInterval=30


sendUpdate() {
	xsetroot -name " VOL: $vol | MIC: $micMute | RAM: $freeRam | SSD: $ssdSpace | BAT: $charge% | $time "
}


counter=0
while :; do
	if [ $(($volUpdateInterval * $freeRamUpdateInterval * $ssdSpaceUpdateInterval)) -eq $counter ]; then
		counter=0
	fi


	if [ $((counter % 1)) -eq 0 ]; then
		time="$(date +%H:%M:%S)"
	fi
	if [ $((counter % $volUpdateInterval)) -eq 0 ]; then
		vol="$(/home/adam/Scripts/volume-get.sh)"
		micMute="$(/home/adam/Scripts/status-mic.sh)"
	fi
	if [ $((counter % $freeRamUpdateInterval)) -eq 0 ]; then
		freeRam="$(/home/adam/Scripts/free-ram.sh)"
	fi
	if [ $((counter % $ssdSpaceUpdateInterval)) -eq 0 ]; then
		ssdSpace="$(/home/adam/Scripts/ssd-space.sh)"
	fi
	if [ $((counter % $batteryUpdateInterval)) -eq 0 ]; then
		charge="$(/home/adam/Scripts/status-bat.sh)"
	fi

	sendUpdate

	counter=$(($counter+1))
	sleep 1
done
