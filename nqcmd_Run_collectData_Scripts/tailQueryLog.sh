#!/bin/bash
#set -xv
timeout 1890s tail -fn0 /bi/domain/fmw/user_projects/domains/bi/servers/obis1/logs/obis1-query.log > ${1}/logfiles/${2} &
