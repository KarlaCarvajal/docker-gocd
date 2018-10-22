#!/bin/bash

docker build -t machine/gocd-client -f DockerfileClient .
docker run --name server-gocd-client -itd -e GO_SERVER_URL=https://server-gocd:8154/go --link server-gocd --restart always machine/gocd-client