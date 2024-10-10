#!/usr/bin/bash
set -e

echo "Enter URL"
read URL
echo "1. Download Audio 2. Download Video: "
read CHOICE

if [ $CHOICE -eq 1 ] 
 then
	echo "Enter the name you want the file to have with a .m4a extension"
	read downloadName
	filename=$(yt-dlp -x -f bestaudio[ext=m4a] --restrict-filenames $URL | grep Destination | awk '{print $3}')
	mv $filename $downloadName
else
	echo "Enter name of video file with .webm extension"
	read downloadName
	filename=$(yt-dlp --restrict-filenames $URL | grep Destination | awk '{print $2}')
        #mv $filename $downloadName
	echo "$filename"
fi
