#!/bin/bash

MINICONDA_BIN=$HOME/miniconda/bin

# There is a bug in miniconda or pip. To get around we add --ignore-installed.
$MINICONDA_BIN/pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0rc0-cp27-none-linux_x86_64.whl

echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64/:$LD_LIBRARY_PATH"' >> $HOME/.bashrc
