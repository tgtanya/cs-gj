FROM ubuntu:18.04

RUN apt-get -y update && apt-get install -y openssh-server
RUN apt-get clean
RUN apt-get install -y rsyslog && apt-get install -y rsync

EXPOSE 22
