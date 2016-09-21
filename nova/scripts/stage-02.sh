#!/bin/bash

rm /etc/nginx/sites-enabled/default

for dir in /var/www/nova \
           /etc/uwsgi \
           /var/log/nginx/nova \
           /var/log/uwsgi/nova \
           /run/uwsgi
do
  mkdir -p ${dir}
done

for comp in api
do
#  cp /usr/share/nova/wsgi.py /var/www/nova/${comp}
  cat > /var/www/nova/${comp} << __EOF__
#!/usr/bin/env python

import sys

sys.exit(0)
__EOF__
  chmod 755 /var/www/nova/${comp}
  chown www-data:www-data /var/www/nova/${comp}
done

chown -R www-data:www-data /var/log/nginx/nova /var/log/uwsgi/nova
chown -R root:www-data /run/uwsgi
chmod 0775 /run/uwsgi

apt-get clean
