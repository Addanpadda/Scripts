#!/bin/bash
speaker="alsa_output.pci-0000_00_1b.0.analog-surround-40"
headset="alsa_output.usb-0d8c_C-Media_USB_Headphone_Set-00.iec958-stereo"

output=$(pacmd list-sinks | grep -A1 "*" | awk 'NR == 2' | awk '{ print $2 }')

# If pulse is not started wait for it
while [ "$output" == "" ]
do
	sleep 0.1
	pkill -RTMIN+10 i3blocks
	exit
done

# If left mouse button is clicked, toggle speaker or headset
if [ "$BLOCK_BUTTON" == "1" ]
then
	if [ "$output" == "$speaker" ]
	then
		/home/adam/Scripts/speakerctl.sh $headset > /dev/null 2>&1
	elif [ "$output" == "$headset" ]
	then
		/home/adam/Scripts/speakerctl.sh $speaker > /dev/null 2>&1
	fi

	output=`pacmd list-sinks | grep -A1 "*" | awk 'NR == 2' | awk '{ print $2 }'`
fi

# Outputing what to display
if [ "$output" == "<$speaker>" ]
then
	echo "🔊" # Displaying a speaker
elif [ "$output" == "<$headset>" ]
	then
	echo "🎧" # Displaying a headset
else
	echo "Error"
fi

