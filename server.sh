#!/bin/bash

if [ -d $(pwd)/godata ]
then
    echo "Directory godata exists."
else
    echo "Creating the directory godata."
    mkdir $(pwd)/godata
    chmod -R 755 $(pwd)/godata
fi


if [ -d $(pwd)/go ]
then
    echo "Directory go exists."
else
    echo "Creating the directory go."
    mkdir $(pwd)/go
    chmod -R 755 $(pwd)/godata
fi

docker run --name server-gocd -d -p 8153:8153 -p 8154:8154 -v $(pwd)/godata:/godata -v $(pwd)/go:/home/go \
-e GOCD_PLUGIN_INSTALL_github.pr=https://github.com/ashwanthkumar/gocd-build-github-pull-requests/releases/download/1.4.0-RC/github-pr-poller-1.4.0-RC.jar \
--restart always gocd/gocd-server:v18.10.0

echo 'GoCD server running OK :)'

sh client.sh
