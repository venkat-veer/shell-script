#!/usr/bin/bash

#everything in shell is considered as string

number1=100
number2=200
Name=DevOps
sum=$(($number1+$number2))
# sum=$(($number1+$number2+$Name))        # ignore name here because it is string right

echo "sum is: ${sum}" 


leaders=("Modi"-"Putin"-"Trudo"-"Trump")
echo "All leaders: ${leaders[@]}"               # retrive all values
echo "first leader: ${leaders[0]}"               # retrive all values