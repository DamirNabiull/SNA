#!/bin/bash

to_backup_dir=$"/home/dale/Documents/SNA"
newdir=$"/home/$USER"

if [ ! -d "$newdir" ]
then
    `mkdir $newdir`
fi

if [ -d "$newdir/backup.tar.gz" ]
then
    rm -f $newdir/backup.tar.gz
fi

tar -cvpzf $newdir/backup.tar.gz $to_backup_dir