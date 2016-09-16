#!/bin/bash

DIR=`pwd`
source $DIR/docker_env.sh

source $DIR/env.sh && docker-compose -f mesos.yml up -d

sleep 5

docker-compose -f mesos_slave.yml up -d
