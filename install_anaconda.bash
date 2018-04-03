#!/bin/bash -v

ANACONDA="/home/drussier/Anaconda3-5.1.0-Linux-x86_64.sh"

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
python -m spacy download en

exit 0
