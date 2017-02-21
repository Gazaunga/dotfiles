# conky
(sleep 3s && conky | dzen2 -x '1100' -e '' -fg '#66a9ba' -bg '#000000' -w '820' -h '12' -ta r -fn '-*-ohsnap-medium-*-normal-*-12-*-*-*-*-*-iso8859-*' -p ) &

# fonts
xset +fp /usr/share/fonts/local &
xset fp rehash &

# wm
exec dwm
