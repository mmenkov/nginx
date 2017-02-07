FROM ubuntu:14.04
MAINTAINER mmenkov@digital-mind.ru

RUN \
  apt-get update && \
  apt-get install -y openssh-server apache2 supervisor nginx && \
  mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor && \
  echo 'root:password' | chpasswd && \
  sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

COPY supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 22 80 443

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
