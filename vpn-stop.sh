#!/bin/bash
sudo killall openvpn && notify-send "VPN" "VPN stopped successfully" || notify-send "VPN" "VPN accounted an error while stopping" && pkill -RTMIN+13 i3blocks
