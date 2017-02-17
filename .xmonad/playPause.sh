#!/bin/bash

playing="$(mpc status | awk 'NR==2 {print $1}' | sed -e 's|\[||' -e 's|\]||')"

if [ "$playing" == "playing" ]; then
    icon=$(echo "^ca(1,mpc toggle)^i(/home/tyler/images/icons/8/pause.xbm)^ca()")
    echo $icon
else
	icon=$(echo "^ca(1,mpc toggle)^i(/home/tyler/images/icons/8/play.xbm)^ca()")
	echo $icon
fi
