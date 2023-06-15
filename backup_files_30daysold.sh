#!/bin/bash

# Declaring Path and log file variables
CHECK_PATH="/home/ritesh/Desktop"
BACKUP_FILE_LOG="/home/ritesh/Documents/Backup_Files_Project/$(basename ${0})_backup.$(date +%y%m%d).log"

FILE_COUNT=$(find ${CHECK_PATH} -type f -mtime +30 | wc -l)
TAR_FILE="/home/ritesh/Documents/Backup_Files_Project/Backup.$(date +%d%m%y).tar"

# Find all files older than 30 days and moving it to backup directory

find $CHECK_PATH -type f -mtime +30 -exec tar -rvf ${TAR_FILE} {} --remove-files \; > ${BACKUP_FILE_LOG} 2>&1

# Checking if previous find and copy command was successfull.

if [[ ${?} -eq 0 && ${FILE_COUNT} -gt 0 ]]
then
    echo "${FILE_COUNT} Files successfully backedup"
    echo "Compressing tar file" >> ${BACKUP_FILE_LOG}
    gzip ${TAR_FILE} >> ${BACKUP_FILE_LOG}
else
    echo "FILE BACKUP FAILED" >> ${BACKUP_FILE_LOG}
    exit 1
fi 

exit 0
