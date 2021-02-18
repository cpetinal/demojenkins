#!/bin/bash

containerName=$1
docker cp ../jobs/test ${containerName}:/var/jenkins_home/jobs
