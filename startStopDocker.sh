#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'please specify service'
    exit 0
fi

if [ $# -eq 1 ]; 
then
#srvname=$1

echo "Checking docker is running or not"

if [ "$(systemctl is-active $1)" == active ];
then
sleep 1
echo "$1 is running"
else
echo "$1 is not running"
echo "Attempting to start $1"
systemctl start $1
sleep 5
echo "starting $1"
sleep 5
if [ "$(systemctl is-active $1)" == active ];
then
sleep 5
echo "$1 Started"
else 
echo "Could not start $1"
fi
fi
exit 1
fi

if [ $# -eq 2 ];
then

echo "Checking docker is running or not"

if [ "$(systemctl is-active $1)" == active ];
then
sleep 1
echo "$1 is running"
else
echo "$1 is not running"
echo "Attempting to start $1"
systemctl start $1
sleep 5
echo "starting $1"
sleep 5
if [ "$(systemctl is-active --quiet $1)" == active ];
then
sleep 5
echo "$1 Started"
else
echo "Could not start $1"
fi
fi


echo "Checking $2 is running or not"
sleep 1
if [ "$(docker ps -q -f name=$2)" ];
then
	if [ "$(docker ps -aq -f status=running -f name=$2)" ];
then
    echo "$2 is running"
sleep 1
fi
else
    if [ "$(docker ps -aq -f status=exited -f name=$2)" ]; 
    then
        echo "$2 is not running"
	sleep 1
	echo "attempt starting $2"
	sleep 1
	docker start $2
	sleep 2
	echo "$2 started" 
else
sleep 1
echo "no such container"
fi
fi
exit 2
fi