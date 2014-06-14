#!/bin/bash

petuum_dir=~/mine/code/petuum

git clone https://github.com/sailinglab/petuum $petuum_dir
cd $petuum_dir
make
cd $petuum_dir/src/strads
make
