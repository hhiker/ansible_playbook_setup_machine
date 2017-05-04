#!/bin/bash
MINICONDA_BIN=$HOME/miniconda/bin/

# Install pycuda
wget https://pypi.python.org/packages/e8/3d/4b6b622d8a22cace237abad661a85b289c6f0803ccfa3d2386103307713c/pycuda-2016.1.2.tar.gz -O /tmp/pycuda-2016.1.2.tar.gz
tar -xvf /tmp/pycuda-2016.1.2.tar.gz -C /tmp
cd /tmp/pycuda-2016.1.2
$MINICONDA_BIN/python configure.py --cuda-root=/usr/local/cuda-8.0
make -j 4 install
