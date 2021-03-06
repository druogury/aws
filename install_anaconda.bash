#!/bin/bash -i

ANACONDA=${HOME}/Anaconda3-5.1.0-Linux-x86_64.sh
MINICONDA=${HOME}/Miniconda3-latest-Linux-x86_64.sh

cd $HOME
if [ -f $MINICONDA ]; then
   echo "File $MINICONDA already exists."
else
   echo "File $MINICONDA does not exist => Download"
   # wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
   wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
bash $MINICONDA -b -p ~/anaconda3
echo 'export PATH="~/miniconda3/bin:$PATH"' >> ~/.bashrc

# https://askubuntu.com/questions/64387/can-not-successfully-source-bashrc-from-a-shell-script?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
# https://ubuntuforums.org/showthread.php?t=1876075
source ~/.bashrc
sleep 2s

pip install --upgrade pip pyflakes
exit 0

conda create -y -n py36gensim python=3.6 anaconda
source activate py36gensim
pip install joblib gensim spacy testfixtures
python -m spacy download en
