#!/usr/bin/bash

set -e                                     # means exit when u got error.

error(){
    echo "There si an error"
}

trap error ERR 

echo "Hello.."
echo "Before Error.."
abcdefghijkl;dnf            # here shell understands there is an error and signal is ERR.
echo "After Error"