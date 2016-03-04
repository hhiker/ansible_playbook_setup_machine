#!/bin/bash

MINICONDA_FILE=/tmp/miniconda.sh

# Install
wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O $MINICONDA_FILE
bash $MINICONDA_FILE -b -p $HOME/miniconda

# Update .bashrc
echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> $HOME/.bashrc
