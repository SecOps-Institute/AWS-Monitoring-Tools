#!/bin/bash
# Author: aarvee11
# Use: system monitor script to dump CPU, RAM and HDD Usage on an ubuntu 14.04 box in total used %

MYIP=$(hostname -I);
MYHOSTNAME=$(hostname)
ID=$(curl http://169.254.169.254/latest/meta-data/instance-id);
while true
do
	FREE_DATA=`free -m | grep Mem` 
	CURRENT=`echo $FREE_DATA | cut -f3 -d' '`
	TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
	echo "{\"time\":\""$(date +%Y-%m-%dT%H:%M:%S%z)"\",\"AWS-ID\":\""$ID"\",\"CPU-LOAD\":`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`,\"MEMORY-USED\":$(echo "scale = 2; $CURRENT/$TOTAL*100" | bc),\"DISK-USED\":`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`}" >> /var/log/system-health.log;
	unset FREE_DATA;
	unset CURRENT;
	unset TOTAL;
	sleep 10;
done
