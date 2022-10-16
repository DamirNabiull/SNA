#!/bin/bash

for file in $(ps -ef | grep 'fun[0-9][0-9]*process' | awk -F " " '{print $2}'); do
    $(kill -9 $file)
done