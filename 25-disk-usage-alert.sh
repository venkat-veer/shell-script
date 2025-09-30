#!/usr/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=3                                # in project we keep it as 75 ok
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
MESSAGE=""

while IFS= read -r line
do
    # echo "Line $line"             # just for print purpose ok
    USAGE=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        # echo "High Usage on $PARTITION: $USAGE"
        MESSAGE="High Disk Usage on $PARTITION: $USAGE %"
    fi
done <<< $DISK_USAGE

echo "Message Body: $MESSAGE"