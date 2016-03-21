FROM ubuntu
MAINTAINER Cristian Calin <cristian.calin@orange.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install curl
COPY mos61.list /etc/apt/sources.list.d
RUN apt-get update && apt-get -y install \
	nginx \
	supervisor \
	uwsgi \
        uwsgi-plugin-python && \
    apt-get clean

