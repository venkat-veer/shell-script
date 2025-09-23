#!/usr/bin/bash

# DATE=$(date)
# echo "Timestamp executed is :$DATE"

begin_tme=$(date +%s)                       # time in seconds ok.
sleep 3
dead_tme=$(date +%s)

total_tme=$(($dead_tme-$begin_tme))

echo "script executed in: $total_tme seconds"