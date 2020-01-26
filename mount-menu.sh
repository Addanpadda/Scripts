#!/bin/bash
device="$(sudo blkid -o list | grep "not mounted" | awk '{print $1 ":" $3}' | sed 's/:(not//' | sed 's/:(not//' | sed 's/:mounted)//' | dmenu -p "Mount")"
device=$(echo $device | cut -d: -f1)

destination=$(echo "/mnt" | dmenu -p "Destination")

if [ $device ] && [ $destination ]
then
	sudo mount $device $destination && notify-send "Mount" "Successfully mounted $device at $destination"
fi
