#!/bin/bash
user="freevpn.im"
pass="$(/home/adam/Scripts/vpn-pass.py)"
echo -e "$user\n$pass" > /home/adam/Documents/VPN/vpn-login.txt

sudo openvpn --daemon --config /home/adam/Documents/VPN/FreeVPN.im-TCP443.ovpn && notify-send "VPN" "VPN started successfully" || notify-send "VPN" "VPN accounted an error while starting" && pkill -RTMIN+13 i3blocks
