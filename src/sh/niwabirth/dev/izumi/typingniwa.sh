#!/bin/bash

echo "please input your name"
read NAME
echo
echo "thank you!"
sleep 1
echo "Let's Start Typing Niwa-"
sleep 2

exec 3< data.txt 

START_S=`date +%s`
START_N=`date +%4N`
MISS=0

while read FL 0<&3
do
 clear
 echo $FL
 while read input
 do
  if [ $input = $FL ]
  then
   break
  else
   echo 
   echo "miss!"
   MISS=`expr "${MISS}" + 1`
   sleep 1
   clear
   echo $FL
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
echo -e "Congratulations!"
echo your time = $TIME_S.$TIME_N
echo your miss = $MISS


echo $NAME $TIME_S $TIME_N $MISS >> ranking.txt
