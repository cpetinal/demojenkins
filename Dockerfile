FROM jenkins/jenkins:2.263.4-lts-centos7

LABEL maintainer="cpetinal@gmail.com"

COPY ./src/conf/plugins.txt /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_HOME="/var/jenkins_home"
ENV JENKINS_UC_DOWNLOAD="http://mirrors.jenkins-ci.org"
ENV JENKINS_SERVICE_PATH="/etc/service/jenkins"
ENV CASC_JENKINS_CONFIG="${JENKINS_HOME}/casc_configs/jenkins.yaml"
ENV JENKINS_PRECONFIG_FOLDER="/usr/share/jenkins/ref"

RUN /usr/local/bin/install-plugins.sh < $JENKINS_PRECONFIG_FOLDER/plugins.txt
COPY ./src/scripts/run.sh /etc/service/jenkins/run
COPY ./src/conf/casc_configs/ $JENKINS_PRECONFIG_FOLDER/casc_configs

