#! /bin/bash -v

ANACONDA="/home/drussier/Anaconda3-5.1.0-Linux-x86_64.sh"
EMACS_DIR="/home/drussier/.emacs.d"

sudo apt-get install -y unzip

if [ -f $ANACONDA ]; then
   echo "File $ANACONDA already exists."
else
   echo "File $ANACONDA does not exist => Download"
   wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
   bash $ANACONDA
   echo -e $"\n#Anaconda path\nexport PATH=/home/drussier/anaconda3/bin:$PATH" >> ~/.bashrc
fi
source ~/.bashrc
sleep 2s

pip install --upgrade pip
conda create -y -n py36gensim python=3.6 anaconda
source activate py36gensim
pip install joblib
pip install gensim
pip install spacy
pip install testfixtures
pip install --upgrade awscli
python -m spacy download en
aws configure

# https://askubuntu.com/questions/851633/emacs-25-on-ubuntu-16-10
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install -y emacs25
/usr/bin/emacs-25.325 --version

if [ ! -d "$EMACS_DIR" ]; then
    mkdir .emacs.d
fi
cd .emacs.d ; git init
git remote add origin https://github.com/drussier/emacs-config.git
git pull origin master

echo -e $'
[user]
        name = drussier
        email = damien.russier@gmail.com
' >> ~/.gitconfig

echo -e $'#!/bin/bash -vf

EMACS="/usr/bin/emacs-25.325 -q --load ~/.emacs.d/init.el -nw"
et() { $EMACS "$@" ; }
# https://unix.stackexchange.com/questions/73484/how-can-i-set-vi-as-my-default-editor-in-unix
export VISUAL=$EMACS
export EDITOR="$VISUAL"

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
