#!/bin/bash
usage()
{
    printf "%b" "
Usage:

Set up Ansible on Control Machine.

The OS should be Ubuntu 14.04.

bash init.sh USER_NAMEgHOSTS

Args:
    USER_NAME: You user name on the control machine you would like to use
    HOSTS: hosts to run on
        Ansible with.

Boilerplates are commented out in the script. Uncomment them to use.
"
}

if [ $# -ne 2 ]
then
    usage
    exit 0
fi

USER_NAME=$1
HOSTS=$2

# # Clean up home folder.
# cd
# rmdir Desktop Documents Music Pictures Public Templates Videos

# # Install necessary softwares.
# sudo apt-get -y install tmux git vim
# # Better output format for Ansible.
# sudo apt-get -y install cowsay
# # We have to use password to sometimes.
# sudo apt-get -y install sshpass
# sudo apt-get -y install python-pip
# sudo pip install paramiko PyYAML jinja2 httplib2 six
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

# # Install R.
# ansible-playbook "${PLAYBOOK_HOME}/R.yml" \
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

# ansible-playbook "${PLAYBOOK_HOME}/desktop.yml" \
    # -i "${PLAYBOOK_HOME}/hosts" -K \
    # --extra-vars "hosts=local_machine user=$USER_NAME"

# ansible-playbook "${PLAYBOOK_HOME}/setup_user_home.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -k \
#     --extra-vars "hosts=$HOSTS user=$USER_NAME new_user=$USER_NAME"

# ansible-playbook "${PLAYBOOK_HOME}/worker.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" -K \
#     --extra-vars "hosts=$HOSTS user=$USER_NAME"

# ansible-playbook "${PLAYBOOK_HOME}/tensorflow_0.6.yml" \
    # -i "${PLAYBOOK_HOME}/hosts" -K \
    # --extra-vars "hosts=ie_machine user=$USER_NAME"

# ansible-playbook "${PLAYBOOK_HOME}/local_packages.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" \
#     --extra-vars "hosts=$HOSTS user=$USER_NAME"

# ansible-playbook "${PLAYBOOK_HOME}/local_tf_0.6.yml" \
#     -i "${PLAYBOOK_HOME}/hosts" \
#     --extra-vars "hosts=$HOSTS user=$USER_NAME"


# ansible-playbook "${PLAYBOOK_HOME}/programming.yml" \
    # -i "${PLAYBOOK_HOME}/hosts" -K \
    # --extra-vars "hosts=local_machine user=$USER_NAME"
