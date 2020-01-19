#!/bin/bash
if [ "$(pacmd list-sources | grep "*" -A 11 | grep muted | awk '{print $2}')" == "yes" ]
then
	echo "OFF"
else
	echo "ON"
fi
