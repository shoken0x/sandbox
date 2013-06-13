#!/bin/bash

clear
echo "***************************************"
echo "********* typingniwa ranking **********"
echo "***************************************"

sort -nk2 $1 | head -10 | awk '{print "rank "NR" "$1" "$2"."$3" sec, "$4" miss typing"}'

