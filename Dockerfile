# Build an image of latest stable nginx
FROM nginx
MAINTAINER Menkov Maxim <mmenkov94@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y openssh-server supervisor
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY supervisord.conf /etc/supervisor/supervisord.conf
