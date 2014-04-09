#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Usage: $0 <folder stores pub keys fetched from servers> <sysadmin name>"
    echo "Note pub keys folder should not contain / in the end."
    exit
fi

pub_key_folder=$1
sysadmin=$2
pub_keys_file="servers_pub_keys.txt"

for hosts_dir in $pub_key_folder/*;
do
    cat $hosts_dir/home/$sysadmin/.ssh/id_rsa.pub >> $pub_keys_file
done

rm -r ./pub_keys/

mv ./servers_pub_keys.txt ../roles/make_servers_sshable_by_each_other/files/
