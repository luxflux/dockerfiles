FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales

RUN apt-get update && apt-get install -y \
  wget \
  unbound && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/jwilder/dockerize/releases/download/v0.0.2/dockerize-linux-amd64-v0.0.2.tar.gz
RUN tar -C /usr/local/bin -xvzf dockerize-linux-amd64-v0.0.2.tar.gz

RUN touch /var/log/unbound.log
RUN chown unbound. /var/log/unbound.log

ADD local-zone.tmpl /usr/local/src/local-zone.tmpl
ADD defaults.conf /etc/unbound/unbound.conf.d/defaults.conf

EXPOSE 53
EXPOSE 53/udp

CMD ["dockerize", "-template", "/usr/local/src/local-zone.tmpl:/etc/unbound/unbound.conf.d/local-zone.conf", "-stdout", "/var/log/unbound.log", "unbound", "-v"]
