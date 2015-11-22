#!/bin/sh

# Variables
datadir=/data
databackup=/mnt/1
videodir=/data/video
videobackup=/mnt/2

# rsync home folder
# rsync -rv --delete /home $datadir/backup

# MySQL Database Backups
#cp /root/mysql.sql $datadir/conf/
#rsync -rv --delete /root/mysqlbackup $datadir/conf

# Apache Configuration
#cp /etc/httpd/conf/httpd.conf $datadir/conf/
#rsync -rv --delete /etc/httpd/conf.d $datadir/conf

#cp /etc/php.ini $datadir/conf/
#cp /etc/resolv.conf $datadir/conf/
#cp /etc/hosts $datadir/conf/
#cp /etc/samba/smb.conf $datadir/conf/
#cp /etc/fstab $datadir/conf/
#cp /etc/proftpd.conf $datadir/conf/
#cp /etc/exports $datadir/conf/
#cp /var/spool/cron/root $datadir/conf/
#cp /etc/ssmtp/ssmtp.conf $datadir/conf/

# bash_history
#cat /root/.bash_history >> $datadir/conf/.bash_history

# rsync /data
rsync -av --delete --exclude video --exclude html --exclude tobedeleted --exclude subversion --exclude ghost /mnt/data/ 192.168.1.67:/mnt/1
#rsync -av --delete /mnt/video/ $videobackup

# stats
#/usr/bin/du -sh $databackup/* > $databackup/du-sh.txt
#/usr/bin/du -sh $datadir/* > $datadir/du-sh.txt
#/usr/bin/du -sh $videobackup/* > $videobackup/du-sh.txt
#/usr/bin/du -sh $videodir/* > $videodir/du-sh.txt
