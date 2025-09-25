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

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "MYSQL"
else
    echo -e "mysql already exist:$Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "NGINX"
else
    echo -e "nginx already exist:$Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "python3 already exist:$Y SKIPPING $N"
fi