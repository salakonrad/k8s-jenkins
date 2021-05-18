FROM jenkins/jenkins:2.268-jdk11
USER root

RUN /usr/local/bin/install-plugins.sh ssh-slaves
RUN /usr/local/bin/install-plugins.sh kubernetes

USER jenkins
