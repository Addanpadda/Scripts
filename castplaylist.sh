#!/bin/bash
#musicDir="/home/adam/Music"
#playlistdir="/home/adam/.config/mpd/playlists"
#playlist="Good Music"

#if [ ! "$1" == "" ]; then
#	playlist="$1"
#fi
#playlist="$(echo $playlist | sed 's/\ /\\ /g')"
#escapedMusicDir="$(echo $musicDir | sed "s/\//\\//g")"


#cd /home/adam/Music
#echo \""$(sed ':a;N;$!ba;s/\n/\" \"/g' ~/.config/mpd/playlists/Good\ Music.m3u)\"" | xargs castnow --shuffle
echo \""/home/adam/Music/$(sed ':a;N;$!ba;s/\n/\" \"\/home\/adam\/Music\//g' /home/adam/.config/mpd/playlists/Good\ Music.m3u)\"" | xargs castnow --shuffle > /dev/null 2>&1 &
sleep 5
castnow --reboot
