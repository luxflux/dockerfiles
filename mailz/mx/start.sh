#!/bin/sh

set -ex

postconf -e mydestination="$MAIL_NAME, localhost.localdomain, localhost"
echo $MAIL_NAME > /etc/mailname

service rsyslog start
service postfix start

sleep 2

tail -f /var/log/mail.log
