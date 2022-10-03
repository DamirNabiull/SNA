#!/bin/bash
options1="\"option 1\" \"option 2\" \"quit\""

echo options1 $options1

eval set $options1
select opt in "$@"
do
echo $opt
if [ "$opt"="quit" ]; then
        exit
fi
done