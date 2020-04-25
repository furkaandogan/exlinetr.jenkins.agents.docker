FROM jenkins/jnlp-slave
MAINTAINER exlinetr<it@exlinetr.com>

LABEL Author="exlinetr"
LABEL AuthorMail="it@exlinetr.com"
LABEL Version="1.0.0"

USER root

RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install gettext-base -y
# RUN apt-get install apt-transport-https 
# RUN apt-get install ca-certificates 
# RUN apt-get install gnupg-agent 
RUN apt-get install software-properties-common -y

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    cosmic \
    stable"


RUN apt-get update 
RUN apt-get install docker-ce-cli -y

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
