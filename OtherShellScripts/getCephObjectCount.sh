#!/usr/bin/env bash

#!/bin/bash

for i in {1..11}
do

filename="/var/lib/ceph/osd/ceph-"$i
echo "processing for " $filename
filecount=`find  /var/lib/ceph/osd/ceph-$i/current/11.*head -type f | wc -l`
echo $filename "--" $filecount >> newfile.txt

done

echo "Done"
