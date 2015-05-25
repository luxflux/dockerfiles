FROM ubuntu:15.04

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales

RUN apt-get update && apt-get install -y \
    postfix \
    rsyslog && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 25
EXPOSE 465
EXPOSE 587

ADD start.sh /usr/local/bin/start.sh

CMD [ "/usr/local/bin/start.sh" ]
