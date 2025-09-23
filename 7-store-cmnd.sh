#!/usr/bin/bash

# DATE=$(date)
# echo "Timestamp executed is :$DATE"

begin-tme=$(date +%s)
sleep 3
dead-tme=$(date +%s)

total-tme=$(($dead-tme-$begin-tme))

echo "script executed in: $total-tme seconds"