#!/bin/bash

#
#	Usage for a timer of 1 hour, 2 minutes and 3 seconds:
#	./timer.sh 3 2 1
#
#	Requires 'pcspkr' kernel module loaded 
#

CorrectTimeVariables() {
	if [ ! $min ]; then
		min=0
	fi
	if [ ! $hour ]; then
		hour=0
	fi
}

DecreseSecond() {
	sec=$(($sec-1))

	if [ $sec -lt 0 ]; then
		min=$(($min-1))
		sec=59
	fi

	if [ $min -lt 0 ]; then
		hour=$(($hour-1))
		min=59
	fi
}

CheckTimeEnd() {
	if [ $sec -eq 0 ] && [ $min -eq 0 ] && [ $hour -eq 0 ]; then
		Sound &
	while :; do
			echo -ne "Time's up!      \r"
			sleep 1
			echo -ne "                \r"
			sleep 1
		done
	fi
}

Sound() {
	while :; do
		echo -ne "\a"
		sleep 0.5
	done
}


sec=$1
min=$2
hour=$3
CorrectTimeVariables

while :; do
	CheckTimeEnd
	echo -ne "Time left: $hour:$min:$sec   \r"
	DecreseSecond
	sleep 1
done
