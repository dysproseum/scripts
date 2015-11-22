#!/bin/sh
echo "Checking status...";

grep UUUUUUUU /proc/mdstat
if [ $? -eq 0 ]
then
	echo "Conditions normal";
	exit 0
else
	echo "Condition failed";
        /usr/sbin/ssmtp dysproseum@gmail.com < /home/david/scripts2/monitoring/mdstat_message.txt
fi
exit 1
