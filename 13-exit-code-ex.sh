#!/usr/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "ERROR: Please run the script with ROOT Privilege"
    exit 1      # failure is other than 0
fi

validate(){                     # functions receive input through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is Success"
    fi

}

dnf install mysql -y
validate $? "MYSQL"

dnf install nginx -y
validate $? "Nginx"

dnf install mongodb-mongosh -y
validate $?  "mongosh"
