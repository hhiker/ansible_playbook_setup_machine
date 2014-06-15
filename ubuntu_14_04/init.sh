#!/bin/bash 

# Clean up home folder.
cd
rmdir  Desktop Documents Music Pictures Public Templates Videos

# Install necessary softwares.
sudo apt-get install tmux git vim
sudo apt-get install python-pip
sudo pip install paramiko PyYAML jinja2 httplib2
sudo apt-get install openssh-server

# # Varaibles.
ROOT_FOLDER="$HOME/mine"
SOFTWARE_FOLDER="${ROOT_FOLDER}/softwares"

# Setup directory structure.
mkdir -p ${SOFTWARE_FOLDER}

# Setup ansible
git clone git://github.com/ansible/ansible.git ${SOFTWARE_FOLDER}
git clone https://github.com/shawnLeeZX/ansible_playbooks ${SOFTWARE_FOLDER}/playbooks

# Setup ssh.
cd
echo -e 'y\n' |  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh 127.0.0.1

PLAYBOOK_HOME="${ROOT_FOLDER}/playbooks/ubuntu_14_04/"

# source ${SOFTWARE_FOLDER}/ansible/hacking/env-setup

# Run playbooks.
ansible-playbook "${PLAYBOOK_HOME}/site.yml" \
    -i "${PLAYBOOK_HOME}/hosts" -K \
    --extra-vars "hosts=local_machine user=shawn"
