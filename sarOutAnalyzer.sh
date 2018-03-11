#!/bin/bash
#this will take all the sarOutput files from the current dir, and give the averages of network bandwidth and packets transfered during the test

for file in *
do
 echo $file
 echo "kilobytes received/sec " `cat $file | grep -i "eth0"| awk '{ sum += $6; n++ } END { if (n > 0) print sum / n; }'`
 echo "kilobytes transmitted/sec" `cat $file | grep -i "eth0"| awk '{ sum += $7; n++ } END { if (n > 0) print sum / n; }'`
 echo "packets received/sec" `cat $file | grep -i "eth0"| awk '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'`
 echo "packets transmitted/sec" `cat $file | grep -i "eth0"| awk '{ sum += $5; n++ } END { if (n > 0) print sum / n; }'`
 echo
done
