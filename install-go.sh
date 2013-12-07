#!/bin/bash

cd /home/$USER_NAME

if [ -d "/usr/local/go/bin/go" ]
then
    echo "Go already installed..."
else 
    curl -s http://go.googlecode.com/files/go1.2.linux-amd64.tar.gz | tar -v -C /usr/local -xz
fi

