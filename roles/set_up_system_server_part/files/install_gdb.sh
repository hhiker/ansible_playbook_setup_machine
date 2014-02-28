#!/bin/bash

cd /tmp
tar -xvf ./gdb-7.7.tar.gz
cd gdb-7.7
sudo make install
sudo update-alternatives --install /usr/bin/gdb gdb /usr/local/bin/gdb 70
cd ..
rm -r gdb-7.7 gdb-7.7.tar.gz
