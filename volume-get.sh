#!/bin/bash
data="$(pacmd list-sinks | grep "*" -A 11)"

if [ "$(echo "$data" | grep muted | grep yes)" ]; then
    echo "MUTED"
else
    echo -e "$(echo "$data" | grep volume | awk 'NR == 1 {print $5}')"
fi
