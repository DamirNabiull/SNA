#!/bin/bash
newdir=$"/backups"
if [ ! -d "$newdir" ]
then
    `mkdir $newdir`
fi
backupdate=$(date +%b_%d_%Y_%H_%M_%S)
tar -zcvpf $newdir/home_backup_$backupdate.tar.gz /home/dale/Documents/SNA