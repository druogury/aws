#!/bin/bash -v

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#upgrade-docker-ce
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo service docker stop
sudo rm /var/run/docker.pid

# in screen
tmux new -s dockerd
# sudo dockerd -H tcp://127.0.0.1:2375 &

exit 0
