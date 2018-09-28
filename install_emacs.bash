#!/bin/bash -i

EMACS_DIR=${HOME}/.emacs.d

if [ ! -d "$EMACS_DIR" ]; then
    mkdir ~/.emacs.d
fi
cd $EMACS_DIR ; git init
git remote add origin https://gitlab.com/druprivate/emacs-config.git
git pull origin master
./install.bash

exit 0
