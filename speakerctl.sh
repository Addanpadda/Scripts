#!/bin/bash
output=$1

pacmd set-default-sink $output
for source in $(pacmd list-sink-inputs | grep index | awk '{print $2}')
do
	echo "Switching" $source
	pacmd move-sink-input $source $output > /dev/null 2>&1
done

