#!/bin/bash
touch /var/log/alarm.log
while :
do
lines=$(journalctl SYSLOG_FACILITY=10 -p info --since="30sec ago" --grep="3 incorrect password attempts" | wc -l)
if [ "$lines" == "3" ]; then
echo "Three or more authentication failure in 30 seconds" >> /var/log/alarm.log
echo "Print log to /var/log/alarm.log"
else
echo "Line #${lines}"
fi
sleep 1
done
