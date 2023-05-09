##!/bin/bash

docker volume create gitlab-runner-volume

docker run -d --name gitlab-runner --restart always --env TZ=US \
   -v  gitlab-runner-volume:/etc/gitlab-runner \
   -v /var/run/docker.sock:/var/run/docker.sock \
   gitlab/gitlab-runner:alpine
