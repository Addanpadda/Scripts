#!/bin/bash

volUpdateInterval=60
freeRamUpdateInterval=5
ssdSpaceUpdateInterval=10

counter=0

while :; do
	if [ $(($volUpdateInterval * $freeRamUpdateInterval * $ssdSpaceUpdateInterval)) -eq $counter ]; then
		counter=0
	fi


	if [ $((counter % 1)) -eq 0 ]; then
		time="$(date +%H:%M:%S)"
	fi
	if [ $((counter % $volUpdateInterval)) -eq 0 ]; then
		vol="$(/home/adam/Scripts/i3volume.sh)"
		micMute="$(/home/adam/Scripts/mic-status.sh)"
	fi
	if [ $((counter % $freeRamUpdateInterval)) -eq 0 ]; then
		freeRam="$(/home/adam/Scripts/free-ram.sh)"
	fi
	if [ $((counter % $ssdSpaceUpdateInterval)) -eq 0 ]; then
		ssdSpace="$(/home/adam/Scripts/ssd-space.sh)"
	fi


	xsetroot -name " VOL: $vol | MIC: $micMute | RAM: $freeRam | SSD: $ssdSpace | $time "

	
	counter=$(($counter+1))
	sleep 1
done
