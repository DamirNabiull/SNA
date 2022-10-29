#!/bin/bash

while true;
    do dd if=/dev/zero of=/dev/null
done &

upt="Uptime:\n\n"
inode="n\nInode usage:\n\n"
mem="\n\nMemory usage:\n\n"
disk="\n\nDisk usage:\n\n"
log="\n\nSystem log:\n\n"

while true;
do echo -e "HTTP/1.1 200 OK$upt$(uptime)$inode$(df -i)$mem$(free -m)$disk$(df -k)$log$(tail -n 15 /var/log/syslog)" \
    | nc -l -k -p 8080 -q 1;
done