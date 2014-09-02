#!/bin/bash

cd /tmp
tar -xvf ./vim74.tar.gz
cd vim74
sudo make install
sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/vim 40
cd ..
rm -r vim74 vim74.tar.gz
