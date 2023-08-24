#! /bin/bash 

#validations,colors,log redirections

LOGFILE_DIRCTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRCTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""

while IFS= read line
do
    #this command will give you usage in number format for comparison
    USAGE=$(echo $line | awk '{print $6}' | cut -d % -f1)
    #this command will give us the partition
    PARTITION=$(echo $line | awk '{print $1}')
    #now you need to check whether usage is more than threshold or not
    if [ $USAGE -gt $DISK_USAGE_THRESHOLD ];
    then
        message+="HIGH DISK USAGE on $PARTITION: $USAGE\n"
    fi
done <<< $DISK_USAGE

echo -e "message: $message"

#echo "$message | mail -s "High Disk Usage" info@joindevops.com
#how to call other shellscript from your current script - by using sh 

sh mail.sh harika.paineni@gmail.com "High Disk Usage" "$message" "Devops Team" "HIGH DISK USAGE"