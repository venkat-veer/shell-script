#!/usr/bin/bash

echo "All variables passed to the script:$@"
echo "All variables passed to the script:$*"

 echo "script name:$0"                              # gives script name ok
 echo "current working directory:$PWD"              # gives current directory path
 echo "who is running this:$USER"                  # current running user
 echo "home directory of user:$HOME"                # user home directory
 echo "PID of the script:$$"