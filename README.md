# aws  
Setup an EC2 AWS instance with Git, Python (Miniconda), Emacs, and aliases in ~/.bash_profile

## Procedure  
1. Install git
```{r, engine='bash', submit}
sudo apt-get update && \
sudo apt-get install -y python-software-properties && \
sudo add-apt-repository ppa:git-core/ppa && \
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
cd ~/proj/aws-ec2-setup/ && ./setup_ec2.bash
```

5. Clone working [repo](https://github.com/druogury/apps_install) 
```{r, engine='bash', submit}
cd ~/proj && git clone git@github.com:druogury/apps_install.git
```

## Shutdown
```{r, engine='bash', submit}
sudo shutdown now
```
