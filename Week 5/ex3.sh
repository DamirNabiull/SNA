#!/bin/bash
for file in $(find / -type f -wholename '*bin/bash*' 2>/dev/null); do
    if [[ -x $file ]] ; then
        echo $file
    fi
done