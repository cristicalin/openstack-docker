FROM ubuntu
MAINTAINER Cristian Calin <cristian.calin@orange.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install curl
COPY mos8.list /etc/apt/sources.list.d
RUN curl -sSL http://fuel-repository.mirantis.com/mos-repos/ubuntu/8.0/archive-mos8.0.key | apt-key add - && \
    apt-get update && apt-get -y install \
	nginx \
	supervisor \
	uwsgi \
        uwsgi-plugin-python && \
    apt-get clean

