#!/bin/bash

containerName=$1
volume=$2
docker cp ./jobs/test ${containerName}:/var/jenkins_home/jobs
chown -R 1000:1000 $volume/jobs/test
docker container restart ${containerName}
