#!/bin/sh

# Variables
datadir=/data

# Apache Configuration
cp -v /etc/apache2/httpd.conf $datadir/conf/
rsync -rv --delete --copy-links /etc/apache2/conf.d $datadir/conf

cp -v /etc/php5/apache2/php.ini $datadir/conf/
cp -v /etc/resolv.conf $datadir/conf/
cp -v /etc/hosts $datadir/conf/
cp -v /etc/samba/smb.conf $datadir/conf/
cp -v /var/spool/cron/crontabs/root $datadir/conf/
cp -v /etc/ssmtp/ssmtp.conf $datadir/conf/
