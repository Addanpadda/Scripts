#!/bin/bash
if [ $(ps -ef | grep openvpn | wc -l) -gt 1 ] 
then
    echo -e " ACTIVE\n\n#00ff00"
else
    echo -e " DEAD\n\n#ff0000"
fi
