#!/bin/sh

# Backup from directory on server

# Hostname
HOST=""

# Admin email
MAIL=""

# Email Tag
EMAIL_SUBJECT_TAG="[backup of $HOST]"

/usr/local/bin/s3cmd sync -v --recursive /home/backups/* s3://s3-bucket-name

if [ "$?" = "0"]; then 
	echo "Daily backup successful. | mail -s "$EMAIL_SUBJECT_TAG Backup successful" $MAIL
else
	echo "Daily backup failed. | mail -s "$EMAIL_SUBJECT_TAG Backup failed" $MAIL
fi
