FROM ubuntu:15.04

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales

RUN apt-get update && apt-get install -y dovecot-imapd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/srv/vmail"]
RUN groupadd -g 5000 vmail
RUN useradd -g vmail -u 5000 vmail -d /vmail -m

EXPOSE 993

ADD config/auth.conf /etc/dovecot/conf.d/10-auth.conf
ADD config/lda.conf /etc/dovecot/conf.d/15-lda.conf
ADD config/logging.conf /etc/dovecot/conf.d/10-logging.conf
ADD config/mail.conf /etc/dovecot/conf.d/10-mail.conf
ADD config/master.conf /etc/dovecot/conf.d/10-master.conf

CMD dovecot -F
