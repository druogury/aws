#!/bin/bash -i

# follow https://docs.docker.com/install/linux/docker-ce/ubuntu/

# remove older versions
sudo apt-get remove docker* # docker-engine docker.io

OS_VERSION=$(cat /etc/os-release | grep VERSION_ID | sed 's/"//g' | awk 'BEGIN{FS="=";}{print $2;}' | awk 'BEGIN{FS=".";}{print $1;}')

if [[ $OS_VERSION -gt 14 ]]
then
    echo "Ubuntu > 14 : "$OS_VERSION
else
    echo "Ubuntu 14"
    sudo apt-get update
    sudo apt-get install \
        linux-image-extra-$(uname -r) \
        linux-image-extra-virtual
fi

# set up the repository
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1
sudo apt-get update && sudo apt-get install -y docker-ce
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

exit 0
