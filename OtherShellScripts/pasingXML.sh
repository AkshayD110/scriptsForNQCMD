#!/bin/sh
#This script updated the time stamp of the conversations in a xml file
set -xv
# Usage ./changeTheXml.sh <filePath> <timeToAdd>
#<timeToAdd> -- Adding 1000 to epoc time will increase time by 16mins.

export filepath=$1
export increaseEpocTime=$2

#copy and keep an original file
cp $filepath `echo ${filepath}copy`
grep -i "StartTimeUTC" $filepath | grep -o '[0-9]\+' | while read -r line ; do
	echo "Processing $line"
	newVal=$((line + increaseEpocTime))
#	echo "newvalue is $newVal"
	sed -i "s/${line}/${newVal}/g" $filepath
#	sed -e "/s/\$line/\$newVal/g" $filepath
done
echo "All replace done"
