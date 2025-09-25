#!/usr/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Hello World"            # if u dont mention $N the next output also follow same colour
echo "Check this Colour"

echo -e "$Y Hello World $N"            # if u  mention $N the current output only follow applied colour
echo "Check this Colour"

echo -e "$N Hello World"
echo "Check this Colour"

