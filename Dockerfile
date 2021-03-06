FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y python-pip cron

ENV CURATOR_VERSION 4.2.1
RUN pip install --quiet elasticsearch-curator==${CURATOR_VERSION}

RUN mkdir /actions /config
ADD crontab /etc/crontab
ADD templates/* /templates/

ADD run.sh /usr/bin/run.sh

ENTRYPOINT "/usr/bin/run.sh"
