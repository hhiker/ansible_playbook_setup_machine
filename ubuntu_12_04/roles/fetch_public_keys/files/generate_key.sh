#!/bin/bash

cd
echo -e 'y\n' |  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
