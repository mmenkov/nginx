# Build an image of latest stable nginx
FROM nginx
MAINTAINER Menkov Maxim <mmenkov94@gmail.com>

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40976EAF437D05B5
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y openssh-server supervisor
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD supervisord.conf /etc/supervisor/supervisord.conf
