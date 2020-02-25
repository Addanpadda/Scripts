#!/bin/bash
if [ $(ps -ef | grep "$0" | wc -l) -gt 3 ]
then
	kill $(ps -ef | grep "$0" | awk 'NR == 1 {print $2}')
fi

while :
do
	for image in $(find /home/adam/Pictures/Backgrounds)
	do
		feh --bg-scale $image
		sleep 120
	done
done
