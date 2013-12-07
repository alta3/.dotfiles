#!/bin/bash

cd /home/$USER_NAME

if [ -d "/usr/local/bin/fish" ]
then
    echo "Fish already installed..."
else
	wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz
	tar -zxf fish-2.1.0.tar.gz && cd fish-2.1.0
	./configure --prefix=/usr/local
	make && make install
    echo '/usr/local/bin/fish' | tee -a /etc/shells
	chsh -s /usr/local/bin/fish
fi 

