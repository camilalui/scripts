#!/bin/bash
# Find files per user and display totals

# Define variable of the PATH

echo "Please, enter the complete PATH of filesystem:"

read dirname

echo

echo "Wait."

echo

# Find files on path per user

/bin/find $dirname -type f -exec ls -l {} \; | gawk '{print $3, $5}' > /tmp/scoreout.txt && \

# SUM of score - utilized space per user

awk '{score[$1]+=$2} END{for (person in score) print person,score[person]}' /tmp/scoreout-$(date +%b-%e-%T).txt

# Remove temporary files

rm /tmp/scoreout.txt

exit 0
