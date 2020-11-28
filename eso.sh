#!/bin/bash
# Start steam if it is not already running
if [ ! $(ps -ef | grep steam | wc -l) -gt 1 ]; then
	steam > /dev/null 2>&1 &
	sleep 15
fi

# Run ESO with proton
STEAM_COMPAT_DATA_PATH="/home/adam/.proton/Elder Scrolls Online" /usr/local/games/steam/steamapps/common/Proton\ 4.2/proton run /home/adam/.proton/Elder\ Scrolls\ Online/pfx/drive_c/Program\ Files\ \(x86\)/Zenimax\ Online/Launcher/Bethesda.net_Launcher.exe -window -steam > /dev/null 2>&1 &
