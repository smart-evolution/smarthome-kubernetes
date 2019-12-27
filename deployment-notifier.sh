#!/bin/bash

curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$NOTIFIER_MSG\"}" $NOTIFIER_URL