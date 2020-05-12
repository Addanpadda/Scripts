#!/bin/bash
charge=$(/home/adam/Scripts/status-bat.sh)

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
