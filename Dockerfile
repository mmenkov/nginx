FROM ubuntu:14.04
MAINTAINER mmenkov@digital-mind.ru

RUN \
  apt-get update && \
  apt-get install -y supervisor && \ 
  mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
