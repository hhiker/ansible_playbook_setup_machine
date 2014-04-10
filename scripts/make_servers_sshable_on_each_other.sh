#!/bin/bash

# This scripts will make remote hosts eable to ssh onto each other.

if [ $# -ne 1 ];
then
    echo "Usage: $0 <username>"
    echo " This scripts will make remote hosts eable to ssh onto each other."
    exit
fi

script_path=$(readlink -f $0)
script_dir=$(dirname $script_path)
playbook_root=$(dirname $script_dir)

# First, if we have not set up ssh keys in remote folder, we can use playbook
# make_servers_sshable_by_each_other.yml to set up and fetch ssh keys from
# remote hosts.
ansible-playbook $playbook_root/fetch_public_keys.yml \
    -i $playbook_root/hosts \
    --extra-vars "hosts=servers"

# After that use this script to merge those keys into one file and delete the
# `pub_keys` folder.
pub_key_folder=$playbook_root/scripts/pub_keys

username=$1
pub_keys_file="servers_pub_keys.txt"

for hosts_dir in $pub_key_folder/*;
do
    cat $hosts_dir/home/$username/.ssh/id_rsa.pub >> $pub_keys_file
done

# Clean up.
rm -r $playbook_root/scripts/pub_keys/

# Move keys in place.
mv $pub_keys_file $playbook_root/roles/make_servers_sshable_by_each_other/files/

# Then, you can use playbook `../make_servers_sshable_by_each_other.yml` to make
# remote hosts eable to ssh onto each other.
ansible-playbook $playbook_root/make_servers_sshable_by_each_other.yml \
    -i $playbook_root/hosts \
    --extra-vars "hosts=servers"

# LAST NOTE: you should manually obtain the finger print of remote hosts manual
# for the time being. Then put it in the folder
# $playbook_root/roles/make_servers_sshable_by_each_other/files/known_host
