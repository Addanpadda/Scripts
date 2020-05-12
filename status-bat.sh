#!/bin/bash
stat="$(cat /sys/class/power_supply/BAT0/status)"
if [ -f /sys/class/power_supply/BAT0/energy_full ]
then
    charge_full=$(cat /sys/class/power_supply/BAT0/energy_full)
    charge_now=$(cat /sys/class/power_supply/BAT0/energy_now)
elif [ -f /sys/class/power_supply/BAT0/charge_full ]
then
    charge_full=$(cat /sys/class/power_supply/BAT0/charge_full)
    charge_now=$(cat /sys/class/power_supply/BAT0/charge_now)
fi

echo $(($charge_now*100/$charge_full))
