#nid of each thread in threaddump is also appended with PID
#script takes input as threadump file

#!/bin/bash
while IFS= read -r line; do
        if [[ $line == *"nid="* ]]; then
                nid=`echo $line | awk -F "nid=" '{print $2}' | awk '{print $1}'`
                pid=`echo "pid fot this thred is $((nid))"`
                echo $line $pid >> ${1}_dumpfile.jstack
        else 
                echo $line >> ${1}_dumpfile.jstack
        fi


done < $1
