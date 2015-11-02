#!/bin/bash
log_location=/home/hts/logs/cleanup.log
now=`/bin/date`
if [ -d /home/hts/recordings/$1 ]; then
	mv /home/hts/recordings/$1 /home/hts/delete/ >> $log_location  2>&1 && echo "$now /home/hts/recordings/$1 deleted" >> $log_location  2>&1
else
	echo "$now /home/hts/recordings/$1 doesn't exist" >> $log_location  2>&1
fi
