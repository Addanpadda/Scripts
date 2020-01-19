#!/bin/bash
if [ "$(echo -e 'Yes\nNo' | dmenu -p 'Reboot?')" == "Yes" ]; then
	sudo reboot
fi
