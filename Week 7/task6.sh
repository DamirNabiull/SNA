#!/bin/bash

CURDISK=$(awk '$2 == "/" {print $1}' /proc/self/mounts)
logdir=$"/var/log/system_utilization.log"

while :
do
    TIME_N=$(top -bn 2 -d 0.01 | grep '^top -' | head -n 1 | awk '{print $3}')
    CPU_U=$(top -bn 2 -d 0.01 | grep '^%Cpu' | tail -n 1 | awk '{print 100-$8}')
    RAM_U=$(top -bn 2 -d 0.01 | grep '^MiB Mem' | tail -n 1 | awk '{print ($8/$4)*100}')
    DISK_U=$(df | grep $CURDISK | awk '{print ($3/$2)*100}')
    
    echo -e $TIME_N "\tCPU % :" $CPU_U "\tRAM % :" $RAM_U "\tDISK % :" $DISK_U >> $logdir

    sleep 15
done