#! /bin/bash

#anyone in our project can call the script with arguments
#write a script to send an email ALERT for High Disk Usage through linux, 
#i already setup an email service in my remote server.

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all Args: $@"
#echo "$Message | mail -s "High Disk Usage info@joindevops.com"

echo "$BODY" | mail -s "$SUBJECT" $TO_ADDRESS
