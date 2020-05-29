#!/bin/bash

while :
do
	echo "Checking supervisor"
	curl -X GET --header "Content-Type:application/json" \
	    "$BALENA_SUPERVISOR_ADDRESS/ping?apikey=$BALENA_SUPERVISOR_API_KEY"
	echo

	echo "Triggering supervisor update"
	curl -iX POST --header "Content-Type:application/json" \
	    --data '{"force": true}' \
	    "$BALENA_SUPERVISOR_ADDRESS/v1/update?apikey=$BALENA_SUPERVISOR_API_KEY"

	sleep 60
done
