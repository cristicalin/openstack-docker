FROM mos/base-api:6.1
MAINTAINER Cristian Calin <cristian.calin@orange.com>

EXPOSE 5000 35357

WORKDIR /root
ADD scripts scripts/
ADD uwsgi /etc/uwsgi/
ADD supervisord /etc/supervisor/conf.d/
ADD nginx /etc/nginx

RUN /root/scripts/stage-01.sh

# 6.1 doesn't supply a separate GPG key so we need force-yes
RUN apt-get update && \
    apt-get -y --force-yes install \
	keystone \
	python-keystone

RUN /root/scripts/stage-02.sh

CMD ["/usr/bin/supervisord"]
