#!/bin/bash
sudo redsocks -c /etc/redsocks.conf
sudo systemctl start docker
sudo sysctl -w net.ipv4.conf.docker0.route_localnet=1

sudo iptables -t nat -N REDSOCKS
sudo iptables -t nat -A REDSOCKS -p tcp -j DNAT --to-destination 127.0.0.1:12345
sudo iptables -t nat -I PREROUTING -p tcp -i docker0 -j REDSOCKS


xhost +local:root
/home/adam/Scripts/tor-start.sh

/home/adam/Scripts/start-docker.sh

# Shutdown
sudo killall redsocks
#sudo iptables -F
#sudo iptables -X
#sudo iptables -Z
#sudo iptables -t nat -F
#sudo iptables -t nat -X
#sudo iptables -t nat -Z
