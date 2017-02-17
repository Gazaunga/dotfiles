#!/bin/bash
source $(dirname $0)/config.sh
XPOS="1085"
WIDTH="250"
LINES="3"

conky --config $HOME/.xmonad/dzen/mpdConkyrc \
| dzen2 -fn bitocra13 -x $XPOS -y 17 -w $WIDTH -h 16 -l $LINES -ta l -e 'onstart=uncollapse;button1=exit;button3=exit'
