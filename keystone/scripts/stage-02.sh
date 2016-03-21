#!/bin/bash

rm /etc/nginx/sites-enabled/default

for dir in /var/www/keystone \
           /etc/uwsgi \
           /var/log/nginx/keystone \
           /var/log/uwsgi/keystone \
           /run/uwsgi
do
  mkdir -p ${dir}
done

for comp in admin main
do
  cp /usr/share/keystone/wsgi.py /var/www/keystone/${comp}
  chmod 755 /var/www/keystone/${comp}
  chown www-data:www-data /var/www/keystone/${comp}
done

chown -R www-data:www-data /var/log/nginx/keystone /var/log/uwsgi/keystone
chown -R root:www-data /run/uwsgi
chmod 0775 /run/uwsgi

apt-get clean
