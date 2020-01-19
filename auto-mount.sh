#!/bin/sh
if [ "$(mount | grep /home/adam/Storage)" ]
then
	echo "Already mounted"
else
	for i in $(seq 1 24)	# 2 min
	do
		if [ "$(ip route)" ]
		then
			echo "Internet connection found, mounting!"
			mount 192.168.1.164:/media/Storage /home/adam/Storage
			exit
		fi
		echo "No internet yet..."
		sleep 5
	done
fi
