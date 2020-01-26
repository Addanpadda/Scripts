#!/bin/bash
LOCATIONS="/home/adam\n/home/adam/Downloads\n/home/adam/Documents\n/home/adam/Pictures"
SOURCE=$(echo -e "$LOCATIONS" | dmenu -p SOURCE)
DEST=$(echo -e "/mnt\n$LOCATIONS" | dmenu -p DESTINATION)

if [ $SOURCE ] && [ $DEST ]
then
	sudo cp $SOURCE $DEST && notify-send "COPY" "Copied $SOURCE to $DEST"
else
	notify-send "COPY" "Not enough information"
fi

