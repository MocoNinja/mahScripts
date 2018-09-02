#! /bin/bash

FILENAME="packages_raw"

MASTER_LINE=""

function appendToMasterLine() {
    #echo "The line to append is $1"
    MASTER_LINE="$MASTER_LINE"" ""$1"
}

function readLine() {
    while IFS=' ' read -r line || [[ -n "$line" ]]; do
        if [[ $line =~ ^# ]]; then 
            echo "That was a comment" >> /dev/null
        else
            # echo "Text read from file: $line"
            appendToMasterLine "$line"
        fi
    # done < "$FILENAME"
    done < "$1"
}

readLine $FILENAME

# echo "AFTER PARSING, THE \$MASTER_LINE IS:$MASTER_LINE" # >> /dev/null

sudo apt install $MASTER_LINE

