#!/bin/bash
speaker="<alsa_output.pci-0000_00_1b.0.analog-stereo>"
headset="<alsa_output.usb-0d8c_C-Media_USB_Headphone_Set-00.iec958-stereo>"

output=`pacmd list-sinks | grep -A1 "*" | awk 'NR == 2' | awk '{ print $2 }'`

while [ "$output" == "" ]
do
	sleep 0.1
	output=`pacmd list-sinks | grep -A1 "*" | awk 'NR == 2' | awk '{ print $2 }'`
	pkill -RTMIN+10 i3blocks
done

# Reacting to left button
if [ "$BLOCK_BUTTON" == "1" ]
then
	if [ "$output" == "$speaker" ]
	then
		/home/adam/Scripts/speakerctl.sh headset > /dev/null
	elif [ "$output" == "$headset" ]
	then
		/home/adam/Scripts/speakerctl.sh speaker > /dev/null
	fi
	output=`pacmd list-sinks | grep -A1 "*" | awk 'NR == 2' | awk '{ print $2 }'`
fi

# Outputing what to display
if [ "$output" == "$speaker" ]
then
	echo "🔊" # Displaying a speaker
elif [ "$output" == "$headset" ]
	then
	echo "🎧" # Displaying a headset
fi

