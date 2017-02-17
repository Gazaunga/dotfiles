#!/bin/bash
source $(dirname $0)/config.sh
XPOS="1605"
WIDTH="200"
pacmanlines=$(pacman -Qu | wc -l)
LINES=$(( $pacmanlines + 2 ))

updates=$(pacman -Qu)

(echo "^fg($white)Updates"; echo "$updates"; echo " "; echo "^fg($white)Click to exit") | dzen2 -p -fg $foreground -bg $background -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'
