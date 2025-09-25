#!/usr/bin/bash

echo "please enter number;"
read number

if [ $((number % 2)) -eq 0 ]; then
    echo "given number $number is EVEN"
else
     echo "given number $number is ODD"
    