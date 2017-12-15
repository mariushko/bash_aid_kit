#!/bin/bash

docker rmi -f mariushko/revealjs &> /dev/null || :
docker build -t mariushko/revealjs .
