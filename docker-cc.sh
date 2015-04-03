#!/bin/bash
# This stops and removes all the containers which have an specific
# string in their name. You have to set this environment variable 
# to the string you want to search for: CONTAINER_REPO
#

echo Stopping containers with $CONTAINER_REPO
/bin/docker ps -a | grep $CONTAINER_REPO | awk '{print $1}' | xargs --no-run-if-empty docker stop

echo Removing containers with $CONTAINER_REPO
/bin/docker ps -a | grep $CONTAINER_REPO | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

exit 0