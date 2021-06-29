#!/bin/bash
DATE=`date +%d%b%y`
HOUR=`date | cut -d " " -f4 | cut -d ":" -f1`
LOCAL_BACKUP_DIR="/backup/"
DB_NAME="--databases soanebritain soanebritaindev soanecrm soanecrm_dev soanecrm_import_test"
DB_USER="root"
DB_PASSWORD="@Yu8=b6pI39&69-d(y6C"
FTP_SERVER="192.168.100.12"
FTP_USERNAME="databackftp"
FTP_PASSWORD="!qPXCh?Z2A"
FTP_UPLOAD_DIR="/backup/"
LOG_FILE=/backup/backup-DATE.log

############### Check Ftp server connection #########
SUCCESS="Server"

FTP=`nc -w 10 $FTP_SERVER 21 < /dev/null | grep -i "server" | awk '{print $2}'` 
echo $FTP
if [[ "$FTP" == *"$SUCCESS"* ]]
then
echo "Connection Successful and now starting backup Process"
	############### Local Backup  ########################
	
if( mysqldump -u $DB_USER  -p$DB_PASSWORD $DB_NAME | gzip  > $LOCAL_BACKUP_DIR/backup-hourly-$DATE-$HOUR.sql.gz ); then
x=0
ftp -n $FTP_SERVER << EndFTP
user "$FTP_USERNAME" "$FTP_PASSWORD"
binary
hash
cd $FTP_UPLOAD_DIR
pwd
lcd $LOCAL_BACKUP_DIR
put "backup-hourly-$DATE-$HOUR.sql.gz"
bye
EndFTP
echo "Database is succesfully backup and uploaded to Ftp Server.The file name is backup-hourly-$DATE.sql.gz" | mailx -s "Warren Creative MYSQL Backup Status Successful" focusit@focus-grp.co.uk
fi
else
echo "Error in database Upload to Ftp Server" | mailx -s "Warren Creative MYSQL Backup Status Failed" focusit@focus-grp.co.uk
fi




Mailx

vi ~/.mailrc

mailx -v -s "$EMAIL_SUBJECT" \
-S smtp-use-starttls \
-S ssl-verify=ignore \
-S smtp-auth=login \
-S smtp=smtp://smtp.gmail.com:587 \
-S from="$FROM_EMAIL_ADDRESS($FRIENDLY_NAME)" \
-S smtp-auth-user=$FROM_EMAIL_ADDRESS \
-S smtp-auth-password=$EMAIL_ACCOUNT_PASSWORD \
-S ssl-verify=ignore \
-S nss-config-dir=~/.mozilla/firefox/xxxxxxxx.default/ \
$TO_EMAIL_ADDRESS

# mailx -v -s "$EMAIL_SUBJECT" $TO_EMAIL_ADDRESS
# mailx -s "Warren Creative MYSQL Backup Status Successful" focusit@focus-grp.co.uk


Link
https://www.systutorials.com/sending-email-using-mailx-in-linux-through-internal-smtp/
https://www.systutorials.com/sending-email-from-mailx-command-in-linux-using-gmails-smtp/
