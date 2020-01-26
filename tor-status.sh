#!/bin/bash

if [ "$(systemctl status tor | grep running)" ]
then
	echo -e " ACTIVE\n\n#00ff00"
else
	echo -e " DEAD\n\n#ff0000"
fi
