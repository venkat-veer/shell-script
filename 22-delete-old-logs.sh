#!/usr/bin/bash

set -e
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

SOURCE_DIR=/home/ec2-user/app-logsssss

if [ ! -d $SOURCE_DIR ]; then                   # d means directory. if dir not exist in source-dir
    echo -e "ERROR:: $SOURCE_DIR does not exist"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)          # find files in current dir more than 14 days

while IFS= read -r filepath          # internal filed seperator
do
    echo "Deleting the file: $filepath"
    rm -rf $filepath
    echo "Deleted the file: $filepath"
done <<< $FILES_TO_DELETE       # for file < for multiple files or variables use <<< ok 