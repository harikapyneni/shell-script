#! /bin/bash

R="\e[31m"
G="\e[32m"
PERSONS=("EDDIE" "JOHN" "ROBERT")

echo -e "First Person:$R ${PERSONS[0]}"
echo -e "all Persons:$G ${PERSONS[@]}"