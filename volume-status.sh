#!/bin/bash
vol=$(/home/adam/Scripts/volume-get.sh)

if [ "$vol" == "MUTED" ]
then
	echo "$vol"
else
	echo -e "$vol\n\n#AE6634"
fi

if [ ! "$vol" ]
then
	sleep 0.1
	pkill -RTMIN+10 i3blocks &
fi
