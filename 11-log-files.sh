#! /bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/SCRIPT_NAME-DATE.log
USERID=$(id -u)

# $1 --> it will recieve the first argument
VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}  

if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script with root access"
    exit 1
#else 
#   echo "INFO :: You are a root user"
fi

# It is your responsibility to check the installation is success or not 

yum install postfix -y

VALIDATE $? "Installing postfix..."

yum install mysql -y

VALIDATE $? "Installing mysql..."