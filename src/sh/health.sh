#!/bin/bash

#サーバがpingを返さなかったらメールする

#SERVERとADDRESSESは一対一対応
#SERVERS=(Gaia Ortega Mash) 
FETARO="fetaro@gmail.com"
SYOKEN="sy0ken@dj.pdx.ne.jp"
GINO="ogi.iphone@gmail.com"
SERVERS=(TestServer TestServer TestServer)
ADDRESSES=(${FETARO} ${SYOKEN} ${GINO})
LOGDIR=/var/log/
DATE=`date '+%Y-%m-%d_%H:%M:%S'`
ERROR=""
MSG=""
SUBJECT="Server is down from MDC."

#if [ ! -e $LOG ]
#then
#    mkdir log
#fi
i=0
for server in ${SERVERS[*]}
do
    ping -c 1 ${server} >/dev/null 2>${ERROR}
    if [ "$?" -ne 0 ]
    then
        MSG="${server} is no reply at ${DATE}.\nError message is \n'${ERROR}'"
        echo "${MSG}"  > ${LOGDIR}health.log
        #mail command
mail -s "${SUBJECT}" ${ADDRESS[i]} <<END
${MSG}
.
END
    fi
    ((i++))
done
