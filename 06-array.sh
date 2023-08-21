#! /bin/bash

R="\e[31m"
G="\e[32m"
PERSONS=("EDDIE" "JOHN" "ROBERT")

echo "First Person:$R ${PERSONS[0]}"
echo "all Persons :$G ${PERSONS[@]}"