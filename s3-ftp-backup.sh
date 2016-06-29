#!/bin/sh

# Backup from directory on server

#### BEGIN CONFIGURATION ####

# Hostname
HOST=""

# From email
LMAIL=""

# Admin email
MAIL=""

#### END CONFIGURATION ####

/usr/bin/s3cmd sync -v --recursive _LOCAL_DIR_/* s3://_BUCKET_NAME_/_SUBDIR_

if [ "$?" = "0" ]; then 
	echo "Subject: $HOST - Daily backup successful." | sendmail -f $LMAIL $MAIL
else
	echo "Subject: $HOST - Daily backup failed." | sendmail -f $LMAIL $MAIL
fi
