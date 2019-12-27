#!/bin/bash

curl -X POST -H 'Content-type: application/json' --data '{"text":"$NOTIFICATION_MSG"}' $URL