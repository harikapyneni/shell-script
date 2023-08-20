#! /bin/bash

#before installing, you need to know whether we are a root user or normal user

USERID=$(id -u)

if [ $USERID -ne 0 ]

then

    echo "ERROR! please run this script with Root access of user"

    exit 1

#else
#echo "INFO : you're a root user"

fi 

yum install mysql -y
