#!/bin/bash
ip="$(curl -s ifconfig.me)"
if [ "$ip" ]
then
	echo -e "🌎 $ip\n\n#00FF00"
fi
