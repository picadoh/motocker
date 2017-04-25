FROM python:2.7-alpine

MAINTAINER Hugo Picado

RUN pip install moto && pip install flask

VOLUME /opt/moto

ADD start.sh .
RUN chmod +x start.sh

EXPOSE 5000

ENTRYPOINT ./start.sh

