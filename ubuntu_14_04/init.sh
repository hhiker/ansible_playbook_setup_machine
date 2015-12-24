#!/bin/bash

usage()
{
    printf "%b" "
Usage:
init.sh will do ubuntu 14.04 setup automatically. All you need to input is your
user name.

bash init.sh USER_NAME
"
}

if [ $# -ne 1 ]
then
    usage
    exit 0
fi
USER_NAME=$1

# # Clean up home folder.
# cd
# rmdir  Desktop Documents Music Pictures Public Templates Videos

# # Install necessary softwares.
# sudo apt-get -y install tmux git vim
# sudo apt-get -y install python-pip
# sudo pip install paramiko PyYAML jinja2 httplib2
# sudo apt-get -y install openssh-server

# Varaibles.
ROOT_FOLDER="$HOME/mine"
SOFTWARE_FOLDER="${ROOT_FOLDER}/softwares"

# # Setup directory structure.
# mkdir -p ${SOFTWARE_FOLDER}

# # Setup ansible
# git clone https://github.com/shawnLeeZX/frozen-ansible ${SOFTWARE_FOLDER}/ansible --recursive
# git clone https://github.com/shawnLeeZX/ansible_playbooks ${SOFTWARE_FOLDER}/playbooks

# # Setup ssh.
# cd
# echo -e 'y\n' |  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
# cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# ssh-add
# # TODO(Shuai) Change known_host directly instead ssh once.
# ssh 127.0.0.1

PLAYBOOK_HOME="${SOFTWARE_FOLDER}/playbooks/ubuntu_14_04"

source ${SOFTWARE_FOLDER}/ansible/hacking/env-setup

# Run playbooks.
# ansible-playbook "${PLAYBOOK_HOME}/site.yml" -vvvv\
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install octopress.
# Use this manually.
# ansible-playbook "${PLAYBOOK_HOME}/octopress.yml" \
    # -i "${PLAYBOOK_HOME}/hosts" -K \
    # --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install emacs.
# ansible-playbook "${PLAYBOOK_HOME}/emacs.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install sklearn.
# ansible-playbook "${PLAYBOOK_HOME}/scikit.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install R.
# ansible-playbook "${PLAYBOOK_HOME}/R.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install ipython
# ansible-playbook "${PLAYBOOK_HOME}/ipython.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install caffe.
# # playbook for caffe is commented in case of accidentally install it since
# # normally it only will be installed on powerful pc or server.
# ansible-playbook "${PLAYBOOK_HOME}/caffe.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install texlive.
# ansible-playbook "${PLAYBOOK_HOME}/texlive.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=local_machine user=$USER_NAME"

# # Install blocks and fuel.
# ansible-playbook "${PLAYBOOK_HOME}/blocks_fuel.yml" \
    # -i "${PLAYBOOK_HOME}/hosts" -K \
    # --extra-vars "hosts=local_machine user=$USER_NAME"

# ansible-playbook "${PLAYBOOK_HOME}/test.yml" \
    # -i "${PLAYBOOK_HOME}/hosts" -K \
    # --extra-vars "hosts=local_machine user=$USER_NAME"

ansible-playbook "${PLAYBOOK_HOME}/desktop.yml" \
    -i "${PLAYBOOK_HOME}/hosts" -K \
    --extra-vars "hosts=local_machine user=$USER_NAME"
