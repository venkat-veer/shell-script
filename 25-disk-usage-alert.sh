#!/usr/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=3                                # in project we keep it as 75 ok
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
MESSAGE=""

while IFS= read -r line
do
    # echo "Line $line"             # just for print purpose ok
    USAGE=$(echo $line | awk '{print $6}' | cut -d '%' -f1)
    PARTITION=$(echo $line | awk '{print $7}')
    if [ $USAGE -ge $DISK_THRESHOLD ]; then
        # echo "High Usage on $PARTITION: $USAGE"
        MESSAGE+="High Disk Usage on $PARTITION: $USAGE % \n"               # escape the \n
    fi
done <<< $DISK_USAGE

echo -e "Message Body: $MESSAGE"

sh mail.sh "s.veerarajesh@gmail.com" "High Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5 