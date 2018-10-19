#!/usr/bin/env bash

#!/bin/bash
#parses the log file for Purge topology and give average Throughput and time taken for each bolt
export filepath=$1

if [ $# -ne 1 ] ; then
        echo "Illegal number of parameters"
        echo "pass the worker.log.stat file as input for the script"
        echo "Usage : ./purgeanalyzer.sh worker.log.stats "
        exit
fi


echo "*purge-appdata-bolt metrics*" >> Resultsfile.txt
echo "Avrg time for purge-appdata-bolt: " `grep -i "purgeappdata" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "Avrg throughput for purge-appdata-bolt :" ` grep -i "purgeappdata" $1 | awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "==============================" >> Resultsfile.txt


echo "*purge-indexed-documents-bolt*" >> Resultsfile.txt
echo "Avrg time for purge-indexed-documents-bolt: " `grep -i "PurgeIndexedDocument" $1 |  awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "Avrg throughput for purge-indexed-documents-bolt: " `grep -i "PurgeIndexedDocument" $1 | awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "==============================" >> Resultsfile.txt

echo "*purge-objectstore-bolt*" >> Resultsfile.txt
echo "Avrg time for purge-objectstore-bolt: " `grep -i "PurgeObjectStore" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "Avrg throughput for purge-objectstore-bolt: " `grep -i "PurgeObjectStore" $1|  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "==============================" >> Resultsfile.txt

echo "*purge-preservationpolicy-bolt*" >> Resultsfile.txt
echo "Avrg time for purge-preservationpolicy-bolt: " `grep -i "PurgePreservationPolicy" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "Avrg throughput for PurgePreservationPolicy: " `grep -i "PurgePreservationPolicy" $1 |  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "==============================" >> Resultsfile.txt

echo "*purge-reconciliation-bolt*" >> Resultsfile.txt
echo "Avrg time for purge-reconciliation-bolt: " `grep -i "PurgeReconciliation" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> Resultsfile.txt
echo "Avrg throughput for purge-reconciliation-bolt: " ` grep -i "PurgeReconciliation" $1 |  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >>Resultsfile.txt

echo "==============================" >> Resultsfile.txt

echo "DONE"