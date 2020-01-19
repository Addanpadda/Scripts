#!/bin/bash

time=$1
echo "Waiting to upload repo at $time"

while :                                                                                                                                                                                               1 ↵
do
	if [ "$(date | awk '{ print $4 }')" == "$time" ]
	then
		echo "Time is here! Uploading your file to github!"
		git push https://github.com/Addanpadda/NGIN
		exit
	fi
	sleep 1
done
