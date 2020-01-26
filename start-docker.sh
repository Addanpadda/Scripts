#!/bin/bash
sudo systemctl start docker
ps=$(docker ps --all)

name=$(echo "$ps" | awk 'NF>1{print $NF}' | sed 's/NAMES/NEW/' | dmenu)
if [ $name == NEW ]
then
	urxvt -e docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name NEW-TEMP adam/kali
	docker stop NEW-TEMP
else
	container_id=$(echo -e "$ps" | grep -w $name | awk '{print $1}')
	urxvt -e docker start -i $container_id
	docker stop $container_id
fi
