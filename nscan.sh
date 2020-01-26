#!/bin/bash
for host in $(seq 0 256)
do
        if [ "$(ping -c1 10.101.0.$host | grep "64 bytes")" ]
        then
                echo "10.101.0.$host is up!"
        fi
done
