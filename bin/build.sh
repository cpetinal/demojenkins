#!/bin/bash -e

if [ -z ${version} ]; 
then
	echo "you need fill the version variable to build it"
	exit 0
fi

docker build -t king-practice:${version} .
