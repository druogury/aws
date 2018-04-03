#!/bin/bash -v

EMACS_DIR="/home/drussier/.emacs.d"

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
##########
EMACS="/usr/bin/emacs-25.325 -q --load ~/.emacs.d/init.el -nw"
et() { $EMACS "$@" ; }
# https://unix.stackexchange.com/questions/73484/how-can-i-set-vi-as-my-default-editor-in-unix
export VISUAL=$EMACS
export EDITOR="$VISUAL"
' >> ~/.bash_aliases

exit 0
