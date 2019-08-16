FROM python:3.7.4-alpine3.10

MAINTAINER Hugo Picado

RUN apk update && apk upgrade
RUN apk add --no-cache openssl-dev libffi-dev musl-dev gcc
RUN pip install --upgrade pip
RUN pip install moto[server]

VOLUME /opt/moto

COPY ./start.sh .

ENTRYPOINT ["/bin/sh", "./start.sh"]
 
EXPOSE 5000
