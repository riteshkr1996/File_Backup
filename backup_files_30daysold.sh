#!/bin/bash

# Declaring Path and log file variables
CHECK_PATH="/home/ritesh/Documents"
BACKUP_FILE_LOG="/home/ritesh/Documents/$(basename ${0})_backup.$(date +%y%m%d)"

FILE_COUNT=$(find ${CHECK_PATH} -type f -mtime -30 | wc -l)

echo ${FILE_COUNT}

# Find all files older than 30 days and moving it to backup directory

find $CHECK_PATH -type f -mtime -30 exec `cp ` > ${BACKUP_FILE_LOG} 2>&1

# Checking if previous find and copy command was successfull.

if [[ ${?} -eq 0 ]]
then
    echo "${FILE_COUNT} Files successfully backedup"
else
    echo "FILE BACKUP FAILED"
fi >&2

exit 0

