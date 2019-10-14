#!/bin/bash

function exitStats() {
	if [ $1 != 0 ]
	then
		echo $2
		exit 1
	fi
}

docker info > /dev/null 2>&1

exitAfterDockerInfo=$?

exitStats $exitAfterDockerInfo "Docker not running, start docker and try againg."

docker images | grep -i "<none>" | while read -r line
do
	arr=($line)
	docker rmi ${arr[2]}
done
