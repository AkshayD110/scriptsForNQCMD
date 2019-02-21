#!/bin/sh
#set -xv

#Usage ./makeListOfFiles.sh <xmlfileFolder>
#note : The xml path should always end with "/"
export xmlsLocation=$1
currentTime=`date '+%Y_%m_%d__%H_%M_%S'`
filename="Filelist$currentTime.txt"
echo "The file name is $filename"
ls -lrht $xmlsLocation | awk -F " " '{print $NF}' > "$filename"

echo "$(tail -n +2 $filename)" > $filename
>>FileList.txt
while read -r line; do

        echo "$xmlsLocation$line" >>FileList.txt

done < $filename

rm -rf $filename
echo "done updating"