#!/bin/sh

# validate required input
if [ -z "$MOTO_SERVICE" ]; then
  echo "Please define AWS service to run with Moto Server (e.g. s3, ec2, etc)"
  exit 1
fi

# setting defaults for optional input
if [ -z "$MOTO_HOST" ]; then
  MOTO_HOST="0.0.0.0"
fi

if [ -z "$MOTO_PORT" ]; then
  MOTO_PORT="5000"
fi

echo "Starting service $MOTO_SERVICE at $MOTO_HOST:$MOTO_PORT"

moto_server $MOTO_SERVICE -H $MOTO_HOST -p $MOTO_PORT
