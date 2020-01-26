#!/bin/bash
if echo -e 'power on\nconnect 00:1E:7C:30:22:5D' | bluetoothctl 
then
	notify-send "Bluetooth" "Trying to connect to headphones..."
else
	notify-send "Bluetooth" "Error occured when trying to connect to headphones!"
fi
