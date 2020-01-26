#!/bin/bash
change_to_sink $1

change_to_sink(){
	pacmd set-default-sink $1
	for source in $(pacmd list-sink-inputs | grep index | awk '{print $2}')
	do
		echo "Switching" $source
		pacmd move-sink-input $source $1 > /dev/null 2>&1
	done
}
