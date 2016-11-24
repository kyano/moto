#!/bin/bash

CURL="/usr/bin/curl"
MOTO_URL="http://localhost:5000"

# start moto server
nohup moto_server -H 0.0.0.0 &
sleep 3

# create sns topics
$CURL -s -x $MOTO_URL -X "POST" -d "Name=MyTopic&Action=CreateTopic" http://sns.us-east-1.amazonaws.com/ > /dev/null 2>&1
$CURL -s -x $MOTO_URL -X "POST" -d "Name=YourTopic&Action=CreateTopic" http://sns.us-east-1.amazonaws.com/ > /dev/null 2>&1
$CURL -s -x $MOTO_URL -X "POST" -d "Name=OurTopic&Action=CreateTopic" http://sns.us-east-1.amazonaws.com/ > /dev/null 2>&1

tail -f nohup.out
