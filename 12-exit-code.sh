#!/usr/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "ERROR: Please run the script with ROOT Privilege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR: Installing MYSQL is failure"
    exit 1
else
    echo "Installing MYSQL is Success"
fi