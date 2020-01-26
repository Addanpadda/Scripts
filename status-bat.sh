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

charge=$(($charge_now*100/$charge_full))

if [ "$stat" == "Charging" ] || [ "$stat" == "Full" ]
then
	stat="AC"
	color="#0000ff"
else
	stat="BAT"
	
	case 1 in
    $(($charge>90)))
    	color="#00ff00";;
    $(($charge>80)))
    	color="#33ff00";;
    $(($charge>70)))     		
    	color="#66ff00";;
    $(($charge>60)))            	
    	color="#99ff00";;
    $(($charge>50)))
    	color="#ccff00";;
    $(($charge>40)))
    	color="#ffff00";;
    $(($charge>30)))
    	color="#ffc000";;
    $(($charge>20)))
    	color="#ff8000";;
    $(($charge>10)))
    	color="#ff4000";;
    $(($charge<=10)))
    	color="#ff0000";;
    esac
fi

echo -e "$stat $charge%\n\n$color"
