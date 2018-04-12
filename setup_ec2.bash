#! /bin/bash -iv

./install_anaconda.bash
py=$(which python)
echo "which python : $py"
./install_emacs.bash
./install_docker.bash

sudo apt-get upgrade && sudo apt-get install -y bzip2, unzip

pip install --upgrade awscli
aws configure
pip install aws-mfa

echo -e $'
[user]
        name = drussier
        email = damien.russier@gmail.com
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
    aws-mfa --device=arn:aws:iam::556593845588:mfa/damien.russier@ogury.co
}

alias ipynb="jupyter notebook &"
alias juplab="jupyter lab &"

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
alias dk="docker -H tcp://127.0.0.1:2375"
alias drmi="dk rmi $(dk images -q)"
alias drm="dk rm $(dk ps -aq)"

##########
alias py36gensim="source activate py36gensim ; which python"
alias proj="py36gensim ; cd $HOME/proj/"
alias appinst="proj ; cd apps_install/src/ ; export PYTHONPATH=$HOME/proj/apps_install/src/ ; pwd"
' >> ~/.bash_aliases

source ~/.bashrc

exit 0
