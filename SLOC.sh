#!/bin/bash

sloc=0

echo "Looking in $1/"

for file in $(ls $1/*cpp $1/*hpp)
do
	echo "$(wc -l $file)" 
	sloc=$(($sloc+$(wc -l $file | awk '{print $1}')))
done

echo "-------------------"
echo "SLOC: $sloc"
