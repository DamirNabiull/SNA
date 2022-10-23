#!/bin/bash

dt=$(date '+%d-%m-%Y %H:%M:%S')
echo "$dt $1" >> /var/log/sna_cron.log