#! /bin/bash

#anyone in our project can call the script with arguments
#write a script to send an email ALERT for High Disk Usage through linux, 
#i already setup an email service in my remote server.

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
echo "escaped content: $BODY"
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all Args: $@"

#echo "$Message | mail -s "High Disk Usage example@email.com"
#construct a proper template- (template.html) and using sed editor to substitute the above arguments with this command

FINAL_BODY=$(sed -e 's/TEAM_NAME/Devops/g' -e 's/ALERT_TYPE/High Disk Usage/g' -e "s/MESSAGE/$BODY/g" template.html)

echo "$BODY" | mail -s "$SUBJECT" $TO_ADDRESS
