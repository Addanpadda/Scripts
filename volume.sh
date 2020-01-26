#!/bin/bash
vol=$(/home/adam/Scripts/get-volume.sh)

if [ "$vol" == "MUTED" ]
then
	echo "$vol"
else
	echo -e "$vol\n\n#AE6634"
fi

if [ ! "$vol" ]
then
	sleep 1
	pkill -RTMIN+10 i3blocks &
fi
