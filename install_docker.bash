#!/bin/bash -i

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#upgrade-docker-ce
sudo apt-get install docker
sudo service docker start
sudo usermod -a -G docker drussier

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
# Log out and log back in again to pick up the new docker group permissions
# docker info

echo -e $'
##########
# alias dk="docker -H tcp://127.0.0.1:2375"
alias drmi="docker rmi $(docker images -q)"
alias drm="docker rm $(docker ps -aq)"
' >> ~/.bash_aliases

source ~/.bashrc

exit 0
