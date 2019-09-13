FROM python:2.7-alpine

MAINTAINER picadoh

RUN apk add --no-cache --update gcc musl-dev libffi-dev openssl-dev
RUN pip install moto && pip install flask

VOLUME /opt/moto

ADD start.sh .
RUN chmod +x start.sh

EXPOSE 5000

ENTRYPOINT ./start.sh
