#!/usr/bin/bash

count=5

echo "Start Count Down.."

while [ count -ge 0]
do
    echo "time left: $count"
    sleep 1                  # pause for 1 second
    count=$((count - 1))     # Decrement the count
done

echo "Time up!" 