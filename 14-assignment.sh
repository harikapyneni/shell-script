#! /bin/bash

# logs Validation script
DATE=$(date +%F)
LOGDIR=/home/centos/shell-script/shellscript-logs/script_name-date.log
SCRIPT_NAME=$0
LOGFILE=LOGDIR/$0-$DATE.log

#color codes
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#user access
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo -e "$R ERROR :: Please do install this with a root user $N"
    exit 1
#else
#   echo "INFO :: You are a root user"    
fi

#validate through function VALIDATE
VALIDATE()
{    
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 installing...$R FAILURE $N"
    else
        echo -e "$2 installing...$G SUCCESS $N"
    fi
}

# all arguments in one ie $@ - loop

for i in $@
do 
    yum list installed $i -y &>>$LOGFILE
    
    if [ $? -ne 0 ]
    then 
        echo "$i is not Installed,Let's Install it!"
        
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i" 
    else
      echo -e "$Y $i is already installed $N"
    fi
        yum install $i -y
done