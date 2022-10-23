#!/bin/bash

to_backup_dir=$"/var/www/html"
newdir=$"/home/$USER"

if [ ! -d "$newdir" ]
then
    `mkdir $newdir`
fi

if [ -d "$newdir/backup_nginx.tar.gz" ]
then
    rm -f $newdir/backup_nginx.tar.gz
fi

tar -cvpzf $newdir/backup_nginx.tar.gz $to_backup_dir