#!/bin/bash
#set -xv

filePath=/root/logfiles/files/*
for file in $filePath
do

echo "Scanning the file - $file"
#for getting the time stamp
cat $file | grep -i "Retrieved sites" | awk '{print  $1, $2}' >> tempTimeStamp.txt
#for getting the main site URL
cat $file | grep "Retrieved sites from" | awk -F "-->" '{print $1}' | awk '{print $(NF-2)}' >> tempretrivedsites.txt
#for getting the count of sites retrived
cat $file | grep "Retrieved sites from" | awk -F "-->" '{print $1}' | awk '{print $NF}' >> tempSiteCount.txt
#for getting the id of each site retrived
#cat $file | grep -i "Retrieved sites" | awk -F "-->" '{print $2}' | awk -F "time" '{print $1}' >> tempSiteID.txt
#for getting the time taken
cat $file | grep -i "Retrieved sites" | awk -F "-->" '{print $2}' | awk -F "," '{print $NF}' | awk '{print $NF}' >> tempTimeTaken.txt
echo "====================================================================="

done

numberOfLine=`cat tempTimeStamp.txt | wc -l`
i=0
while [ $i -lt $numberOfLine ]
do

echo "=====================================================================" >> tempSpaceBreak.txt
i=`expr $i + 1`

done

#if you disable the child-id collector, remember to remove it from below as well
paste -d ", " tempTimeStamp.txt tempretrivedsites.txt  tempSiteCount.txt  tempTimeTaken.txt  > Results.txt

echo "The results are found in Results.txt file"
rm -rf temp*