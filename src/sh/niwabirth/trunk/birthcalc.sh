#!/bin/bash


year=`date +%Y`
nextYear=`expr $year + 1`

nextYearDay=365

i4=`expr $nextYear % 4`
i100=`expr $nextYear % 100`
i400=`expr $nextYear % 400`
ans=`expr $i4 == 0 \& $i100 \!= 0 \| $i400 == 0`
if [ $ans != 0 ]
then
 ((nextYearDay++))
fi


today=`date +%j`
niwa=`date -d '27 Oct' +%j`
nokori=`expr $niwa - $today`

if [ $nokori -le 0 ]
then
 age=`expr $year - 1983 + 1`
 nokori=`expr $nokori + $nextYearDay`
else
 age=`expr $year - 1983`
fi

clear

echo
echo "_____________________________________"
echo " 　　ちさと、$age歳まで              "
echo " 　　あと$nokori日なんだぜ　　　　　 "
echo "-------------------------------------"
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
sleep 2 
