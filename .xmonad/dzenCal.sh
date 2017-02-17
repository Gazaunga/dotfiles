#!/bin/zsh

(
	month=$(date +%B)
	year=$(date +%Y)

	gcal --cc-holiday=US_NY | sed -e 's/</ ^bg(#546A29)^fg(#222222)/;s/>/ ^fg()^bg() /' \
								  -e 's/:/ ^bg(#385E6B)^fg(#222222)/;s/:/ ^fg()^bg()/' \
								  -e 's/Su Mo Tu We Th Fr Sa/^fg(#546A29)Su Mo Tu We Th Fr Sa^fg()/' \
								  -e "s/$(date +'%B %Y')/^fg(#385E6B)$(date +'%B %Y')^fg()/" \
) | dzen2 -p -l 8 -x 1700 -y 1 -w 132 -h 16 -fn 'bitocra' -e 'onstart=uncollapse,hide;button1=exit;button3=exit;'
