FROM ubuntu:15.04

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales

RUN apt-get update && apt-get install -y \
    net-utils \
    amavisd-new \
    spamassassin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 10024

ADD node_id.conf /etc/amavis/conf.d/05-node_id
ADD amavisd.conf /etc/amavis/conf.d/99-mailz

CMD [ "amavisd-new", "foreground" ]

# ADD start.sh /usr/local/bin/start.sh

# CMD [ "/usr/local/bin/start.sh" ]
