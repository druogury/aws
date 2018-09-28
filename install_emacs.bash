#!/bin/bash -i

EMACS_DIR=${HOME}/.emacs.d

# https://askubuntu.com/questions/851633/emacs-25-on-ubuntu-16-10
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install -y emacs25
/usr/bin/emacs-25.325 --version

if [ ! -d "$EMACS_DIR" ]; then
    mkdir ~/.emacs.d
fi
cd ~/.emacs.d ; git init
git remote add origin https://gitlab.com/druprivate/emacs-config.git # https://github.com/drussier/emacs-config.git
git pull origin master


echo -e $'
##########
EMACS="/usr/bin/emacs-25.325 -q --load ~/.emacs.d/init.el -nw"

et() { $EMACS "$@" ; }
etd() { $EMACS "$@" --debug-init ; }
# emacs client in terminal '-t' == '-nw' from 'man emacsclient')
ec() { emacsclient -t ; }
# https://unix.stackexchange.com/questions/73484/how-can-i-set-vi-as-my-default-editor-in-unix
export VISUAL=$EMACS
export EDITOR="$VISUAL"
' >> ~/.bash_aliases

# start/stop the Emacs server
alias emstart="emacs --daemon -q --load ~/.emacs.d/init.el"
alias emstop="emacsclient -e '(kill-emacs)'" # '-e' == eval

exit 0
