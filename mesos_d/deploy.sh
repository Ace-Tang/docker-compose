#!/bin/bash

DIR=`pwd`
source $DIR/docker_env.sh

source $DIR/env.sh 
docker-compose up -f mesos.yml -d

sleep 5

docker-compose up -f mesos_slave.yml -d
