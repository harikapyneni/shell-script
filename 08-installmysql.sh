#! /bin/bash

#To Install MySql
#before installing, you need to know whether we are a root user or normal user

USERNAME=$(id -u)
if [$USERNAME -ne 0]
then
    echo "ERROR! please run this script with Root access"

else
     echo "INFO : you're a root user"
fi 
      