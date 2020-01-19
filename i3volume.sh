#!/bin/bash
#if [ $(ps -ef | grep pulseaudio | wc -l) -lt 2 ]
#then
	#su adam -c "pulseaudio --daemonize=yes"
#fi

line="`pacmd list-sinks | grep -B500 "*" | grep index | wc -l`"
volume=`pacmd list-sinks | grep "volume: front-left:" | awk "NR == $line" | awk '{ print $5 }'`

if [ $(pacmd list-sinks | grep muted: | awk "NR == $line" | awk '{ print $2}') == "yes" ]
then
	echo "🔇"
else
	echo $volume
fi
