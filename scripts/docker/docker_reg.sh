#!/bin/bash

TOKEN='<token>'

docker run --rm -it -v gitlab-runner-volume:/etc/gitlab-runner gitlab/gitlab-runner:alpine register -n \
  --url https://dev.azure.com/s-vasiliev/ \
  --registration-token $TOKEN \
  --executor docker \
  --description "My Docker Runner" \
  --docker-image "docker:20.10.12-dind-alpine3.15" \
  --docker-privileged \
  --docker-volumes "/certs/client"
