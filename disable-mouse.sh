#!/bin/bash
enabled=$(xinput --list-props "SteelSeries SteelSeries Rival 110 Gaming Mouse" | grep "Device Enabled" | awk '{print $4}')

if [ "$enabled" == "1" ]
then
	xinput --set-prop "SteelSeries SteelSeries Rival 110 Gaming Mouse" "Device Enabled" 0
	unclutter --timeout 0&
fi

if [ "$enabled" == "0" ]
then
	xinput --set-prop "SteelSeries SteelSeries Rival 110 Gaming Mouse" "Device Enabled" 1
	kill $(ps -ef | grep unclutter | awk 'NR == 1 {print $2}')
fi
