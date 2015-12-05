#!/bin/bash

cd ~/Google\ Drive

oldtime=$(date --date "$(date -r .)" +%s)

canconnect=1

while :
do
	if [[ $oldtime -lt $(date --date "$(date -r .)" +%s) ]]; then
		oldtime=$(date --date "$(date -r .)" +%s)
		
		ping -c 1 drive.google.com
		if [ $? !=  0 ]; then
			echo "Unable to connect to Google Drive."; canconnect=0
		else
			canconnect=1
		fi
		
		echo Folder changed!
		if [[ canconnect -eq 1 ]]; then
			grive
			oldtime=$(date --date "$(date -r .)" +%s)
		fi
	fi
done
