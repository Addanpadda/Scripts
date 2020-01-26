#!/bin/bash
device=$(mount | awk '{print $1}' | grep / | sed -n '1!G;h;$p' | dmenu -p "Umount")

if [ $device ]
then
	sudo umount $device && notify-send "Unmount" "Successfully unmounted $device"
fi
