#!/bin/bash
if [ "$(echo -e 'Yes\nNo' | dmenu -p 'Shutdown?')" == "Yes" ]; then
	sudo shutdown now
fi
