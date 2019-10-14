#!/bin/bash

# This script can be used to delete all containers which are labeled with <none>.

# This function is used to get the exit code from a command. If the command throws anything but a 0 then this script will stop.
function exitStats() {
	if [ $1 != 0 ]
	then
		echo $2
		exit 1
	fi
}

# Just run a simple docker command to see if docker is running.
docker info > /dev/null 2>&1

# Store exit code.
exitAfterDockerInfo=$?

# Perform method exitStats.
exitStats $exitAfterDockerInfo "Docker not running, start docker and try againg."

# Create a while loop.
docker images | grep -i "<none>" | while read -r line
do
	# Creates an array.
	arr=($line)
	docker rmi ${arr[2]}
done
