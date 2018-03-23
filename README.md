# aws  
Setup an EC2 AWS instance with Git, Python (Anaconda), Emacs, and aliases in ~/.bash_profile

## Procedure  
1. Install git
```{r, engine='bash', submit}
sudo apt-get install -y git  
```

2. create SSH key and add it to GitHub account 
```{r, engine='bash', submit} 
ssh-keygen -t rsa  
```

3. clone repo with setup script
```{r, engine='bash', submit}
mkdir proj ; cd proj
git clone git@github.com:druogury/aws.git
```

4. run setup scripts
```{r, engine='bash', submit}
cd ~/proj/aws
./setup_ec2.bash
```
