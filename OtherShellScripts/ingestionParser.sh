#!/bin/bash
#parses the log file for ingestion topology and give average Throughput and time taken for each bolt
export filepath=$1

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "pass the worker.log.stat file as input for the script"
    echo "example : ./ingestionParser.sh <filePath>"
fi

echo "*DataPartitioningBolt metrics*" >> ReultsFile_ingestion.txt
echo "Avrg time for DataPartitioningBolt: " `grep -i "DataPartitioningBolt" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "Avrg throughput for DataPartitioningBolt :" ` grep -i "DataPartitioningBolt" $1 | awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "==============================" >> ReultsFile_ingestion.txt


echo "*deconstruction-bolt*" >> ReultsFile_ingestion.txt
echo "No data for this bolt in logs." >> ReultsFile_ingestion.txt
echo "==============================" >> ReultsFile_ingestion.txt

echo "*indexer-bolt*" >> ReultsFile_ingestion.txt
echo "Avrg time for indexer-bolt : " `grep -i "IndexingBolt" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "Avrg throughput for indexer-bolt: " `grep -i "IndexingBolt" $1|  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "==============================" >> ReultsFile_ingestion.txt

echo "*ITMObjectStoreCompression*" >> ReultsFile_ingestion.txt
echo "Avrg time for ITMObjectStoreCompression: " `grep -i "ITMObjectStoreCompression" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "Avrg throughput for ITMObjectStoreCompression: " `grep -i "ITMObjectStoreCompression" $1 |  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "==============================" >> ReultsFile_ingestion.txt

echo "*MetadataBolt*" >> ReultsFile_ingestion.txt
echo "Avrg time for MetadataBolt: " `grep -i "MetadataBolt" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "Avrg throughput for MetadataBolt: " ` grep -i "MetadataBolt" $1 |  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >>ReultsFile_ingestion.txt

echo "==============================" >> ReultsFile_ingestion.txt

echo "*ObjectStorageBolt*" >> ReultsFile_ingestion.txt
echo "Avrg time for ObjectStorageBolt: " `grep -i "ObjectStorageBolt" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "Avrg throughput for ObjectStorageBolt: " ` grep -i "ObjectStorageBolt" $1 |  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >>ReultsFile_ingestion.txt

echo "==============================" >> ReultsFile_ingestion.txt


echo "*ReconciliationBolt*" >> ReultsFile_ingestion.txt
echo "Avrg time for ReconciliationBolt: " `grep -i "ReconciliationBolt" $1 | awk -F ',' '{print $4}' | awk -F '"' '{ sum += $4; n++ } END { if (n > 0) print sum / n; }'` >> ReultsFile_ingestion.txt
echo "Avrg throughput for ReconciliationBolt: " ` grep -i "ReconciliationBolt" $1 |  awk -F ',' '{print $NF}' | awk -F ',' '{print $1}' | awk -F '"' '{print $4}' | awk -F '/' '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'` >>ReultsFile_ingestion.txt

echo "==============================" >> ReultsFile_ingestion.txt

echo "DONE"