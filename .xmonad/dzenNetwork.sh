#!/bin/bash
source $(dirname $0)/config.sh
XPOS="1383"
WIDTH="200"
LINES="6"

interface=$(ifconfig enp2s0 | sed -n 1p | awk '{print $1}' | sed 's|:||g')
mac=$(ifconfig enp2s0 | awk '/ether/ {print $2}')
inet=$(ifconfig enp2s0 | sed -n "2p" | awk -F " " '{print $2}')
netmask=$(ifconfig enp2s0 | sed -n "2p" | awk -F " " '{print $4}')
broadcast=$(ifconfig enp2s0 | sed -n "2p" | awk -F " " '{print $6}')

(echo ""; echo " Interface: ^fg($highlight)enp2s0"; echo " IP: ^fg($highlight)$inet";  echo " Netmask: ^fg($highlight)$netmask";  echo " Broadcast: ^fg($highlight)$broadcast"; echo " MAC: ^fg($highlight)$mac";) | dzen2 -p -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
