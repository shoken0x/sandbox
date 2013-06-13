#!/bin/bash
#
#  This is the Birthday present 
#       for Satochiy 
#          from 
#           Syoken Fujisaki
#           Jungo Izumi
#           Tetsutaro Watanabe
#           Nakata
#           and Special Thanks 
#                       Ken Ogino
#          
#                       2008.11.2

shortMode=
rankingMode=
while getopts 'hsvr' OPTION
do
	  case $OPTION in
	  h)	printf "Usage: no option or [-s] [-r] [-h] [-v]\n\n"
		echo "-s,    short mode"
		echo "-r,    ranking mode"
		echo "-h,    help"
		echo "-v,    version"
			exit 0
			;;
	  s)	shortMode=1
			
			;;
	  r)	rankingMode=1

			;;
	  v)	printf "Typing Niwa- Version 1.0\n\n"	
		echo  "This is the Birthday present  "
		echo  "     for Satochiy              " 
                echo  "       from                    " 
		echo  "         Syoken Fujisaki       "
		echo  "         Jungo Izumi           "
		echo  "         Tetsutaro Watanabe    "
		echo  "         Nakata                "
		echo  "         and Special Thanks    "
		echo  "                     Ken Ogino "
		echo  "                               "
		echo  "                     2008.11.2 "
 	 		exit 0 
			;;

	  ?)	printf "Usage: no option or [-s] [-r] [-h] [-v]\n\n"
		echo "-s,    short mode"
		echo "-r,    ranking mode"
		echo "-h,    help"
		echo "-v,    version"
			exit 2
			;;
	  esac
done

if [ "$rankingMode" ]
then
 clear
 ./ranking.sh ranking.txt
 exit 0
fi

if [ "$shortMode" ]
then
  ./birthcalc.sh
  ./typing.sh
else
  ./logo.sh
  ./typing.sh
fi
