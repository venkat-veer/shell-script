#!/usr/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]; then
    echo "ERROR: Please run the script with ROOT Privilege"
    exit 1      # failure is other than 0
fi

validate(){                     # functions receive input through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is:$R failure $N"
        exit 1
    else
        echo -e "Installing $2 is:$G is Success $N"
    fi

}

dnf install mysql -y
if [ $? -ne 0 ]; then
    dnf install mysql -y
else
    echo -e "mysql already exist:$Y SKIPPING $N"

dnf install nginx -y
if [ $? -ne 0 ]; then
    dnf install nginx -y
else
    echo -e "nginx already exist:$Y SKIPPING $N"

dnf install python3 -y
if [ $? -ne 0 ]; then
    dnf install python -y
else
    echo -e "python already exist:$Y SKIPPING $N"
