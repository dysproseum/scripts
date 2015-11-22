#!/usr/bin/php

<?php

/*
create table drivetemp(id int not null auto_increment, primary key(id), volume varchar(16), celsius int, stamp datetime);

smartctl -a /dev/sda | grep -i temp
smartctl -a /dev/sdb | grep -i temp
smartctl -a /dev/sdc | grep -i temp
smartctl -a /dev/sdd | grep -i temp

*/

include('/var/www/html/dysproseum.com/include/dbfunc.php');

//db connect
$link = dbConnect('monitoring');

//run commands
$drives = array('/dev/sdb', '/dev/sdc', '/dev/sdd', '/dev/sde', '/dev/sdf', '/dev/sdg', '/dev/sdh', '/dev/sdi');

foreach($drives as $d) {

	$output = system("/usr/sbin/smartctl -a $d | grep -i temp");
	$val = substr($output, strlen($output) - 2, 2);
	echo "\n\n$val\n\n";
	mysql_query("INSERT INTO drivetemp (volume, celsius, stamp) VALUES ('$d', '$val', NOW())");

}

//insert data

