#!/usr/bin/bash

while IFS= read -r line; do                         # internal field seperator reads line by line ok
    # process each line here
    echo "Processing line: $line"
    # Example: you can perform other operations with the $line variable
    # for instance:
    # some_command "$line"
    # if [[ "$line" == "specific_text" ]]; then
    #         echo "Found specific text!"
    # fi
done < 20-script.sh                                 # input file give