#!/bin/bash

times=$(mpc | sed -n 2p | awk '{print $3}' | sed 's|/| |g')
percent=$(mpc | sed -n 2p | awk '{print $4}' | sed -e 's|(||g' -e 's|)||g' -e 's|\%||g')
remaining=$(echo $times | awk '{print $1}') 
total=$(echo $times | awk '{print $2}')

echo $percent | gdbar -w 150 -h 3 -min 0 -max 100 -l "$remaining " -nonl; echo " $total"
