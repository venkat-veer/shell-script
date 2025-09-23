#!/usr/bin/bash

# DATE=$(date)
# echo "Timestamp executed is :$DATE"

begin-time=$(date +%s)
sleep 3
dead-time=$(date +%s)

total-time=$(($dead-time-$begin-time))

echo "script executed in: $total-time seconds"