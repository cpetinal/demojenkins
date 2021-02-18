#!/bin/bash

source $LIB_PATH/b-log.sh

function executeEnvFile() {
    for f in $ENV_PATH/*.env; do
        . $f
    done
}

function runJenkins() {
    INFO "Running Jenkins"
    java ${JVM_OPTS}                                \
     -Dhudson.model.DirectoryBrowserSupport.CSP="${JENKINS_CSP_OPTS}" \
     -Dhudson.udp=-1                                 \
     -Djava.awt.headless=true                        \
     -Dhudson.DNSMultiCast.disabled=true             \
     -Djenkins.install.runSetupWizard=false          \
     -Djavamelody.statsd-address="${STATSD_UDP_HOST}:${STATSD_UDP_PORT}"  \
     -jar ${JENKINS_FOLDER}/jenkins.war              \
     ${JENKINS_OPTS}                                 \
     --httpPort=${PORT_JENKINS}                      \
     --webroot=${JENKINS_FOLDER}/war                 \
     --ajp13Port=-1                                  \
     --httpListenAddress=${LIBPROCESS_IP}            \
     --ajp13ListenAddress=${LIBPROCESS_IP}           \
     --prefix=${JENKINS_CONTEXT}
}

function main() {
    executeEnvFile
    runJenkins
}

main
