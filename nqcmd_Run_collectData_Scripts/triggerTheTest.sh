#!/bin/bash
#set -xv
export rowCount=500
export filename=$1
export threadCount=$2
export nqcmdInputfile=rdc_query${rowCount}RowReturn.txt

export baseFolder=/u01/app/oracle/tools/home/oracle/rdcTesting/outputFileofTest/aksh_siteF_highRDC/multiThreadRuns/${rowCount}rows_${threadCount}user

if [ ! -e "$baseFolder" ]; then
  mkdir -p $baseFolder
  mkdir -p $baseFolder/topdetails
  mkdir -p $baseFolder/sarouts
  mkdir -p $baseFolder/nqcmdouts
  mkdir -p $baseFolder/logfiles
fi

./cpudetails.sh $baseFolder $filename &
./saroutput.sh $baseFolder $filename &
#./taillog.sh $baseFolder $filename &
./startnqcmd.sh $baseFolder $filename $threadCount $nqcmdInputfile &
