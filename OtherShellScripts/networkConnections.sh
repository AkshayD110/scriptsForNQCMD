# This script outputs the no of established connections to the specified server periodically.
# It executes the netstat command every 15 secs 360 times so 90 mins
# author - Akshay Deshpande

#!bin/sh
javaHostpid=`ps -ef | grep "javahost" |grep "BI" |grep -v grep | awk '{print $2}'`
#managedWLSBIserverpid=`ps -ef | grep "\-Dweblogic.Name" |grep -v grep | grep -v "\-Dweblogic.Name=AdminServer" | grep BI | awk '{print $2}'`
managedWLSBIserverpid=`ps -ef | grep java | grep bi_server1 | grep -v grep | awk '{print $2}'`
saspid=`ps -ef | grep nqsserver |grep -v grep | awk '{print $2}'`
sawpid=`ps -ef | grep sawserver |grep -v grep | awk '{print $2}'`
i=0
T1="$(date +%s)"
echo -e "Time\tOATS TO bi_server1\tbi_server1 to OIDLDAP\tbi_server1 to OBIPS\tOBIS to OBIPS\tOBIJH to OBIPS\tOBIS to DB" > netstat_connections.csv
while [ $i -ne 730 ]
do
# OATS TO bi_server1 > oats box ip
con1=`netstat -nap|grep $managedWLSBIserverpid |grep 10.244.3.61|wc -l`
#bi_server1 to OIDLDAP > not required
con6=`netstat -nap|grep $managedWLSBIserverpid | grep 3060 | wc -l`
# bi_server1 to OBIPS > bi host ip and obips port
con2=`netstat -nap|grep $managedWLSBIserverpid | grep 10.240.123.190:9505 | wc -l`
# OBIS to OBIPS > obis port
con3=`netstat -nap | grep 9507 |grep $saspid |  wc -l`
# OBIJH to OBIPS > obijh port > java host pid
con4=`netstat -nap|grep 9506|grep $javaHostpid | wc -l`
# OBIS to DBi > db port
con5=`netstat -nap | grep 1521 | grep nqsserver | wc -l`
T="$(($(date +%s)-T1))"
printf "%02d:%02d:%02d\t$con1\t\t\t$con6\t\t\t$con2\t\t\t$con3\t\t$con4\t\t$con5\n" "$((T/3600%24))" "$((T/60%60))" "$((T%60))" >>netstat_connections.csv
sleep 15
i=`expr $i + 1`
done
