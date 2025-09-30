#!/usr/bin/bash

# set -e                         # when error founds in script exit immediately if u did not write validate
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
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log
LOG_FILE="$LOGS_FOLDER/backup.log"         # modified to run script as command.

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

### check SOURCE-DIR or DEST_DIR passed or not. ###

if [ $# -lt 2 ]; then
    USAGE
fi 

### check SOURCE_DIR-dir exist or not ###
if [ ! -d $SOURCE_DIR ]; then                               # d checks source dir exists or not
    echo -e "$R:Source $SOURCE_DIR does not exist $N"
    exit 1
fi

### check DEST_DIR exist or not ###
if [ ! -d $DEST_DIR ]; then
    echo -e "$R:Destination $DEST_DIR does not exist $N"
    exit 1
fi

### Find the files ###
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)   

if [ ! -z "${FILES}" ]; then                                    #z -check files empty or not 
    ### start archieving the files ###
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)                                 # archieve to current date-time
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"       # j without full-path only file name

    ### check archieval success or not ###
    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archieval ... $G SUCCESS $N"

        ### Delete if success ###
        while IFS= read -r filepath
        do
            echo "Deleting the File: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES
    else
            echo -e "Archieval ... $G SUCCESS $N"
            exit 1
    fi
else
        echo -e "No Files to archieve ... $Y SKIPPING $N"
fi