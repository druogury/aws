#! /bin/bash -iv

./install_anaconda.bash
source ~/.bashrc
py=$(which python)
echo "which python : $py"

./install_emacs.bash
source ~/.bashrc

./install_docker.bash
source ~/.bashrc

./install_r.bash
source ~/.bashrc

sudo apt-get install -y bzip2 lbzip2 unzip postgresql postgresql-contrib

sudo pip install --upgrade pip awscli
aws configure
sudo pip install aws-mfa
sed -i 's/default/default-long-term/g' ~/.aws/credentials

echo -e $'
[user]
        name = drussier
        email = damien.russier@ogury.co
' >> ~/.gitconfig

echo -e $'#!/bin/bash -vf

gitpull() {
if [ -z "$1" ]
then
    br="master"
else
    br="$1"
fi
git pull origin $br
}

gitpush() {
if [ -z "$1" ]
then
    br="master"
else
    br="$1"
fi
git push -u origin $br
}

ipynb2py() {
jupyter nbconvert --to python $1
}

blk() {
mv "$1" `echo $1 | tr ',' '_' | tr ':' '_' | tr ' ' '_'  | tr -s '_'`
}

mfa() {
    aws-mfa --device=arn:aws:iam::556593845588:mfa/damien.russier@ogury.co # --duration=129600
}

headS3file() { # drussier/apps_usage/sequences/Unsaved/2018/04/19/962bb21f-4313-4323-892d-c711c7a79154.csv
    aws s3api get-object --bucket ogury-tmp --key $1  --range bytes=0-1000000 tmp_file.txt && head tmp_file.txt && rm tmp_file.txt
}

alias ipynb="jupyter notebook &"
alias juplab="jupyter lab &"

##########
# redshift
alias psqlrs="psql -h ogurydatawarehouse.cikxp3g7d0py.eu-west-1.redshift.amazonaws.com -p 5439 -d dwurlvisits -U damien"

########## shortcuts linux
alias  cal="awk 'BEGIN{print \!*}'"
alias  lsn="ls --color=none -F -nalh"
alias lsns="ls --color=none -F -nalhS"
alias  lsr="ls --color=none -F -nalRh"
alias lsrs="ls --color=none -F -nalRhS"
alias   ll="ls -lhrt"
alias   hh="history | egrep -i \!*"
alias  hht="history | egrep -i \!* | tail"
alias    g="gunzip \!* &"
alias   al="source ~/.bash_aliases"
alias edal="et ~/.bash_aliases"


##########git
alias  gi="git init     "
alias gco="git commit   "
alias gch="git checkout "
alias gst="git status   "
alias gbr="git branch   "
alias  gl="git log      "
alias gls="git ls-files "
alias gl1="glo --oneline"
alias grl="git reflog "
alias grb="git rebase "
alias glg="git log --graph --decorate --oneline"

##########
alias proj="cd $HOME/proj/"
alias appinst="proj ; cd apps_install/src/ ; export PYTHONPATH=$HOME/proj/apps_install/src/ ; pwd"
alias projaws="proj ; cd aws-ec2-setup/"
alias d2v="proj ; cd apps-embedding/ ; export PYTHONPATH=$HOME/proj/apps-embedding/src/ ; pwd"
' >> ~/.bash_aliases

source ~/.bashrc

exit 0
