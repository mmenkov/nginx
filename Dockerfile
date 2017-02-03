# Build an image of latest stable nginx
FROM nginx
MAINTAINER Menkov Maxim <mmenkov94@gmail.com>

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get install -y openssh-server supervisor

