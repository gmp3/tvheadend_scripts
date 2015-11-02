#!/bin/bash
#echo "start script"
log=/home/hts/logs/convert.log
now=`/bin/date`

if [[ $1 =~ News ]]; then
	#echo "regex matched"
	echo "$now Not converting $1" >> $log
	exit 
fi

#filename=${1#"/home/hts/recordings/"}
filename=$(basename $1)
#echo $filename
#exit
file_log=/home/hts/logs/$filename.log
echo "$now Starting $filename" >> $log

#doesn't change the video format, just compresses, about 45 minutes for 1 hr video
#/usr/bin/ffmpeg -y -i "$1" -b 1000000 -ac 2 "$1.mpeg" > $file_log  2>&1

#converts video to h264 but leaves audio, takes about 4 hours for 1 hr video
#/usr/bin/ffmpeg -y -i "$1" -vcodec h264 -acodec copy "$1.mkv" > $file_log  2>&1

#converts video to h264 and audio to aac
/usr/bin/ffmpeg -y -i "$1" -c:v libx264 -crf 23 -preset superfast -c:a libfdk_aac -vbr 4 "$1.mkv" > $file_log  2>&1 && rm -f $1
/bin/sed -i "s/$filename/$filename.mkv/g" /home/hts/.hts/tvheadend/dvr/log/*
/usr/bin/comskip $1.mkv "$1.mkv" > $file_log  2>&1
#/bin/ln -s $1.mkv $1
/bin/gzip $file_log
#/bin/date >> $log

now=`/bin/date`
echo "$now Finished $filename" >> $log
