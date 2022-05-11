#!/bin/bash

docker run -dti --restart always --name container-web-tty \
    -p 80:8080 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    wrfly/container-web-tty

# tail logs
docker logs -f container-web-tty
