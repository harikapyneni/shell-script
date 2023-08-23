#! /bin/bash

APP_LOGSDIR=/home/centos/app-logs

DATE=$(date +%F:%H:%M:%S)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGSDIR -name "*.log" -type f -mtime +14)

echo "Scripts started executing at $DATE" &>>$LOGFILE

while read line
do
    echo "Deleting $LINE" &>>$LOGFILE
    rm -rf $LINE
done <<< $FILES_TO_DELETE

