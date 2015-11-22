#!/bin/sh

export t=/data/conf/mysqlbackup
mkdir -p $t
export d=`date +%Y-%m-%d`

/usr/bin/mysqldump --add-drop-table --all-databases > $t/$d.sql
