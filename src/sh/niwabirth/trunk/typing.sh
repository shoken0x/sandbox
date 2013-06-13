#!/bin/bash

function printTalk() {
    echo "--------------------------------------"
    echo $1
    echo "--------------------------------------"
    echo "   o                                  "
    echo "    o                                 "
    echo "        .--.                          "
    echo "       |o_o |                         "
    echo "       |:_/ |                         "
    echo "      //   \ \                        "
    echo "     (|     | )                       "
    echo "    /\'\_   _/\`\                       "
    echo "    \___)=(___/                       "
    echo
}

clear
echo -e "please input your name"
read NAME


while true 
do
 echo -e "\nplease select Question"
 ls ./data | awk '{print NR " " $1}'
 read NUMBER
 i=1
 for lsFile in `ls data` 
 do
  if [ $i == $NUMBER ]
  then
   file=$lsFile
   break 2
  fi
  ((i++))
 done 
 echo -e "\n不正な入力です＞＜\n"
 sleep 1
 clear
done

echo "you selected \"$file\""
echo -e "\nthank you!\n"
sleep 1
echo "++++++++++++++++++++++++++++"
echo "+ Let's Start Typing Niwa- +"
echo "++++++++++++++++++++++++++++"
sleep 1
echo
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1

while read i; do echo $RANDOM" "$i; done < ./data/$file | sort -nk1 | sed -e "s/[0123456789]* //" > ./tmp.txt

exec 3< ./tmp.txt 

START_S=`date +%s`
START_N=`date +%4N`
MISS=0

while read LINE 0<&3
do
 clear
 printTalk "${LINE}"
 while read input
 do
  if [ ${input// /_} = ${LINE// /_} ]
  then
   clear
   printTalk "GJ!!"
   sleep 1
   break
  else
   clear
   printTalk "Miss!! HaHaHa!"
   ((MISS++))
   sleep 1
   clear
   printTalk "${LINE}"
  fi
 done
done
exec 3<&-

END_S=`date +%s`
END_N=`date +%4N`

TIME_S=`expr "${END_S}" - "${START_S}"`
TIME_N=`expr "${END_N}" - "${START_N}"`

if [ $TIME_N -le 0 ]
then 
 TIME_S=`expr "${TIME_S}" - 1`
 TIME_N=`expr "${TIME_N}" + 10000`
fi


clear
printTalk "Congratulations!!"
echo
echo your name = $NAME
echo your time = $TIME_S.$TIME_N
echo your miss = $MISS

echo $NAME `printf "%d %04d" $TIME_S $TIME_N` $MISS $file >> ranking.txt

read input
clear

./ranking.sh ranking.txt $file
