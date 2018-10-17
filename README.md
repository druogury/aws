# aws-ec2-setup  
Setup an EC2 AWS instance with Git, Python (Miniconda), Emacs, and aliases in ~/.bash_profile

## Manual setup  
1. Install git
```{r, engine='bash', submit}
sudo apt-get install -y python-software-properties && \
# http://lifeonubuntu.com/upgrading-ubuntu-to-use-the-latest-git-version/
sudo add-apt-repository -y ppa:git-core/ppa && \
sudo apt-get update && \
sudo apt-get install -y git && \
git --version
```

2. Create SSH key and add it to [GitHub](https://github.com/settings/keys) account 
```{r, engine='bash', submit} 
ssh-keygen -t rsa -q -N "" -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub
```

3. Clone [repo](https://github.com/druogury/aws-ec2-setup) with setup script
```{r, engine='bash', submit}
mkdir proj && cd proj && git clone git@github.com:druogury/aws-ec2-setup.git
```

4. Run install scripts
```{r, engine='bash', submit}
cd ~/proj/aws-ec2-setup/ && sudo ./setup_ec2.bash
```

5. Clone working [repo](https://github.com/druogury/apps_install) 
```{r, engine='bash', submit}
# cd ~/proj && git clone git@github.com:druogury/apps-embedding.git
cd ~/proj && git clone git@github.com:Ogury/lab-apps-iab-categorization.git
```

## From private Docker image
1. Install Docker following the [script](https://github.com/druogury/aws-ec2-setup/blob/master/install_docker.bash)

2. Download the Docker image
```{r, engine='bash', submit}
sudo docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PWD
sudo docker pull drudocker/ogury-dev-tools
```

3. Run a Docker container inside a tmux
```{r, engine='bash', submit}
tmux new -s dckr
sudo docker run -it drudocker/ogury-dev-tools /bin/bash
```

## Shutdown
```{r, engine='bash', submit}
sudo shutdown now
```
