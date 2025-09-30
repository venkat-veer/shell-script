#!/usr/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    echo "Line $Line"
done <<< $DISK_UsAGE