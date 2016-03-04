#!/bin/bash

MINICONDA_BIN=$HOME/miniconda/bin

for pkg in pytest python-gflags tqdm ipython pyzmq tornado pyreadline jsonschema decorator
do
    $MINICONDA_BIN/pip install $pkg
done
