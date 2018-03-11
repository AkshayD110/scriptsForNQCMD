#!/bin/bash
#set -xv
#This is the main script which will call all the other scripts

export baseFolder=/u01/app/oracle/tools/home/oracle/rdcTesting/outputFiles/multiThreadRuns/default_latency
export filename=$1
export threadCount=$2
export nqcmdInputfile=rdc_query5000RowReturn.txt

./cpudetails.sh $baseFolder $filename &
./saroutput.sh $baseFolder $filename &
./taillog.sh $baseFolder $filename &
./startnqcmd.sh $baseFolder $filename $threadCount $nqcmdInputfile &