#!/usr/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$script_name.log"

mkdir -p $logs_folder
echo "Script started executed at:$(date)"

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

dnf list installed mysql &>>log_file 
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>log_file 
    validate $? "MYSQL"
else
    echo -e "mysql already exist:$Y SKIPPING $N"
fi

dnf list installed nginx &>>log_file 
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>log_file 
    validate $? "NGINX"
else
    echo -e "nginx already exist:$Y SKIPPING $N"
fi

dnf list installed python3 &>>log_file 
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>log_file 
    validate $? "python3"
else
    echo -e "python3 already exist:$Y SKIPPING $N"
fi
