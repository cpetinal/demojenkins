#!/usr/bin/env bash

version='0.4.0'

#TODO: delete this line
docker container rm king-practice

configFolder='/home/cpetinal/king/vol/jenkins'
echo "if you have problems with chown you can configure it manually by giving the owner of the volume folder to 1000 user to avoid jenkins runtime problems"

#######################################################
#
# entry script params
#
########################################################
params() {

    local OPTIND options
#    local jenkins_Version="${DEFAULT_JENKINS_VERSION:-}"

    while getopts "vm:h" options;
    do
        case "${options}" in
        v)
            version="${OPTARG}"
	    echo "version: ${version}"
            let args++
            ;;
	m) 
	    configFolder="${OPTARG}"
	    echo "the container have the volume configured to ${configFolder}"
	    let args++
	    ;;	    
	\?)
	    echo "init.sh -v [LOCAL_JENKINS_VERSION] -m [VOL_LOCATION]" 
	    exit 0
	    ;;
	:)
	    echo "invalid option" 
	    exit 0
	    ;;
	h)
	    echo "init.sh -v [LOCAL_JENKINS_VERSION] -m [VOL_LOCATION]"
	    exit 0
	    ;;
        *)
            echo "caso *: ${OPTARG}"
            ;;
        esac
    done
}

params "$@"
if [ -z "${configFolder}" ];
then
	echo "no volumen defined look at help to insert it"
	exit 0;
fi

mkdir -p $configFolder
chown 1000 $configFolder
echo ${version}
echo ${configVersion}
docker run -p 8080:8080 -p 50000:50000 -v $configFolder:/var/jenkins_home:z --name  king-practice -t king-practice:${version}

