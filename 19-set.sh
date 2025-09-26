#!/usr/bin/bash

set -e                                     # means exit when u got error.

# error(){
#     echo "There is an error in $LINENO, Command is: $BASH_COMMAND"
# }

trap 'echo "There is an error in $LINENO, Command is: $BASH_COMMAND"' ERR 

echo "Hello.."
echo "Before Error.."
abcdefghijkl;dnf            # here shell understands there is an error and signal is ERR.
echo "After Error"