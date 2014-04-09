`collect_hosts_pub_keys.sh` is used to get public keys of remotes hosts.

This script is part of the operation chain that makes servers could ssh onto
each other.

First, if you have not set up ssh keys in remote folder, you can use playbook
make_servers_sshable_by_each_other.yml to set up and fetch ssh keys from remote
hosts.

```bash
# cd to the root of the ansible playbooks
cd ..
# use playbook.
ansible-playbook make_servers_sshable_by_each_other.yml -i hosts --extra-vars \
  "hosts=servers"
```

After that use this script to merge those keys into one file and delete the
`pub_keys` folder.

```bash
./collect_hosts_pub_keys.sh ./pub_keys shawn
```

shawn is my sysadmin name. You should change it into your username.

`./collect_hosts_pub_keys.sh` will move the generated file
`./servers_pub_keys.txt` to `../roles/make_servers_sshable_by_each_other/files`.

Then, you can use playbook `../make_servers_sshable_by_each_other.yml` to make
remote hosts eable to ssh onto each other.

```bash
ansible-playbook ./make_servers_sshable_by_each_other.yml -i hosts --extra-var \
  "hosts=servers"
```

LAST NOTE: you should manually obtain the finger print of remote hosts manual
for the time being.
