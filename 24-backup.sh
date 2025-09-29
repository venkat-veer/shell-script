#!/usr/bin/bash

set -e                          # when error founds in script exit immediately
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}                   # if not provided consider as 14 days. 

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo -e "ERROR: please run script with root privilege:$N"
    exit 1 #failure is other than 0
fi

USAGE(){
    echo -e "$R:USAGE: sudo sh 24-backup.sh <SOURCE_DIR> <DESTINATION_DIR> <DAYS> [optional,default 14 days]:$N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R:Source $SOURCE_DIR does not exist $N"
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R:Destination $DEST_DIR does not exist $N"
fi


FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)   

if [ ! -z "${FILES}" ]; then                                    #z -check files empty or not 
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)                                 # archieve to current date-time
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    echo $FILES | zip -@ -j "$ZIP_FILE_NAME"
else
    echo -e "No Files to archieve ... $Y SKIPPING $N"
fi