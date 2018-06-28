#!/bin/bash
#set -xv

filePath=/root/logfiles/files/*
for file in $filePath
do

echo "Scanning the file - $file"
#for getting the time stamp
cat $file | grep -i "Retrieved sites" | awk '{print "Scanned at:" $1, $2}' >> tempTimeStamp.txt
#for getting the number of sites retrieved and parent
cat $file | grep "Retrieved sites from" | awk -F "-->" '{print $1}' | awk -F ":" '{print $(NF-1), $NF}' >> tempretrivedsites.txt
#for getting the id of each site retrived
cat $file | grep -i "Retrieved sites" | awk -F "-->" '{print $2}' | awk -F "time" '{print $1}' >> tempSiteID.txt
#for getting the time taken
cat $file | grep -i "Retrieved sites" | awk -F "-->" '{print $2}' | awk -F "," '{print $NF}' >> tempTimeTaken.txt
echo "====================================================================="

done

numberOfLine=`cat tempTimeStamp.txt | wc -l`
i=0
while [ $i -lt $numberOfLine ]
do

echo "=====================================================================" >> tempSpaceBreak.txt
i=`expr $i + 1`

done

paste -d "\n" tempTimeStamp.txt tempretrivedsites.txt tempSiteID.txt tempTimeTaken.txt tempSpaceBreak.txt> Results.txt

echo "The results are found in Results.txt file"
rm -rf tempTimeStamp.txt tempretrivedsites.txt tempSiteID.txt tempTimeTaken.txt tempTimeStamp.txt
