FROM ubuntu:14.04
MAINTAINER mmenkov@digital-mind.ru

RUN \
  apt-get update && \
  apt-get install -y supervisor nginx && \
  mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 80 443

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
