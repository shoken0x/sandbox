#!/bin/sh
for NO in 1
do
 wget http://it-ebooks.info/book/${NO}/ > /dev/null 2>&1
 HREF=`grep "go/${NO}" index.html`
 rm index.html
 DIR=`echo ${HREF} | cut -d "\"" -f 2`
 URL=http://it-ebooks.info${DIR}
 wget ${URL}
done
