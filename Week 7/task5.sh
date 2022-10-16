#!/bin/bash

trap "echo SIGUSR1 Interraupt received" SIGUSR1
while :
do
    echo "Hello, world"
    sleep 10
done