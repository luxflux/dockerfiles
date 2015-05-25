#!/bin/sh

set -ex

# echo $MAIL_NAME > /etc/mailname
sed -i "s/#\$myhostname.\+/\$myhostname = '${MAIL_NAME}';/" /etc/amavis/conf.d/05-node_id

amavisd-new foreground
