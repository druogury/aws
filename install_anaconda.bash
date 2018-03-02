#! /bin/bash -v

sudo apt-get install git

wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
bash ~/Anaconda3-5.1.0-Linux-x86_64.sh
echo -e $"\n#Anaconda path\nexport PATH=/home/drussier/anaconda3/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

conda create -n py36gensim python=3.6 anaconda
source activate py36gensim
pip install gensim
pip install spacy
python -m spacy download en

# sudo apt-get install emacs23
# http://www.nongnu.org/color-theme/index.html
# sudo apt-get install emacs-goodies-el

# https://askubuntu.com/questions/851633/emacs-25-on-ubuntu-16-10
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs25
/usr/bin/emacs-25.325 --version

mkdir .emacs.d ; cd .emacs.d ; git init
git remote add origin https://github.com/drussier/emacs-config.git
git pull origin master

echo -e $'
[user]
        name = drussier
        email = damien.russier@gmail.com'

echo -e $'#!/bin/bash -vf

et() { /usr/bin/emacs-25.325 -q --load ~/.emacs.d/init.el -nw "$@" ; }

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
alias   xt="xterm -bg black -fg white -fn 10x20 -cm -sl 500 -sb -T Geocluster -e '/bin/csh -l' &"
alias term="terminator -m &"
alias   ko="konsole &"
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
alias py36gensim="source activate py36gensim ; which python"
alias proj="py36gensim ; cd $HOME/proj/"
alias appinst="proj ; cd apps_install/src/ ; export PYTHONPATH=$HOME/proj/apps_install/src/ ; pwd"
' >> ~/.bash_aliases

source ~/.bashrc

exit 0
