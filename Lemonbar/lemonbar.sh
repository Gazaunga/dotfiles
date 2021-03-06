#!/usr/bin/env bash

# how long should the popup (bar) remain?
duration=3

# define geometry
barw=300
barh=35
barx=$(xdpyinfo | grep dimensions | tr -s ' ' ';' | cut -f 3 -d ';' | cut -f 1 -d 'x')
bary=$(xdpyinfo | grep dimensions | tr -s ' ' ';' | cut -f 3 -d ';' | cut -f 2 -d 'x')
let barx=${barx}/2-${barw}/2
let bary=${bary}/2-${barh}/2

# colors
bar_bg='#64000000'
bar_fg='#ffffffff'

# font used
bar_font_1='System San Francisco Display-16'
bar_font_2='FontAwesome-16'
# compute all this
baropt="-d -g ${barw}x${barh}+${barx}+${bary} -o 0 -f ${bar_font_1} -o 2 -f ${bar_font_2} -F${bar_fg} -B${bar_bg}"

#Create the popup and make it live for 3 seconds
(echo -e "${1}"; sleep ${duration}) | lemonbar ${baropt}
