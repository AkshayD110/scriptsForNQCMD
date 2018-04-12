#!/bin/bash

export filename=$1
i=0
while [ $i -lt 900 ]
do
echo "Connections to DB"
echo "==========" >> $filename
echo `date` >> $filename
echo "Total to DB : `netstat -nap | grep --ip here-- |  wc -l`" >> $filename
echo "Established connections to DB : `netstat -nap | grep --ip here--| grep -i est* |  wc -l`" >> $filename
echo "TimedWait connections to DB : `netstat -nap | grep --ip here- | grep -i timed* |  wc -l`" >> $filename
echo "Connections made to OAC box: `netstat -nap | grep 7001 | wc -l`" >>  $filename

sleep 2
i=`expr $i + 2`

done

