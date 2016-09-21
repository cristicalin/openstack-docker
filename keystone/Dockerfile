FROM cristicalin/mos-base-api:7.0
MAINTAINER Cristian Calin <cristian.calin@orange.com>

EXPOSE 5000 35357

WORKDIR /root
ADD scripts scripts/
ADD uwsgi /etc/uwsgi/
ADD supervisord /etc/supervisor/conf.d/
ADD nginx /etc/nginx

RUN /root/scripts/stage-01.sh

RUN apt-get update && \
    apt-get -y install \
	keystone \
	python-keystone

RUN /root/scripts/stage-02.sh

CMD ["/usr/bin/supervisord"]
