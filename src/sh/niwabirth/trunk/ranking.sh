#!/bin/bash

if [ $# -eq 2 ]
then
  files=$2
else
  files=`ls data`
fi

echo "-------------------------------------------------------"
echo "  @@_            Typing Niwa- RANKING              @@_ "
echo "Σ____] __________________________________________Σ____]"

for file in $files
do
  echo
  echo "** ranking of $file **"
  cat $1 | awk '/'"$file"'$/ {print $0}' | sort -nk2 -nk3 | head -5 | awk '{printf "rank %2d %-20s %d.%04d sec, %2d miss typing\n", NR, $1, $2, $3, $4}' 
  
  echo
done
