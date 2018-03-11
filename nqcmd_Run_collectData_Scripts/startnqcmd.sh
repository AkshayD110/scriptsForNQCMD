#!/bin/bash
set -xv

sh /bi/domain/fmw/user_projects/domains/bi/bitools/bin/nqcmd.sh -d AnalyticsWeb -u admin -p Welcome1# -s /u01/app/oracle/tools/home/oracle/rdcTesting/testFiles/${4} -o ${1}/nqcmdouts/${2} -td 1800 -w 0 -ds 10  -t ${3} -q -T -qsel r -utf16
