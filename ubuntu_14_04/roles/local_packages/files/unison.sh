#!/bin/bash

wget http://unison-binaries.inria.fr/files/2011.01.28-Esup-unison-2.40.61-linux-x86_64-text-static.tar.gz -O /tmp/unison.tar.gz
tar -xvf /tmp/unison.tar.gz -C /tmp
mv /tmp/unison-2.40.61-linux-x86_64-text-static $HOME/local/bin/unison
