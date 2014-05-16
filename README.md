# Playbooks locally and remotely

## Roles

1. setting up ubuntu 12.04 from fresh installation on local machine and remote
   machines, which also includes personal config in home folder. It involves the
   following roles:
  * ./roles/files_vim_needs
  * ./roles/make_servers_sshable
  * ./roles/programs_vim_needs
  * ./roles/shawn_init
  * ./roles/system_desktop_part
  * ./roles/system_server_part
  * ./roles/scikit
2. Do some adhoc command on remote machine:
  * `./adhoc/check_alive.yml`: check which machines has down.
  * `./adhoc/add_shawn_as_sysadmin_on_servers.yml`: what the title implies.
3. Setup hadoop(not finished):
  * ./roles/hadoop
4. Setup octopress(not finished):
  * ./roles/octopress
5. Setup petuum:
  * ./roles/petuum
6. Add user on remote machine(not finished):
  * ./roles/user_init

## Scripts
`./scripts/make_servers_sshable_on_each_other.sh`  This scripts will make remote
hosts eable to ssh onto each other.

## Test & Deployment

To test the playbooks on local machine, using the following command:

```bash
ansible-playbook -i hosts PLAYBOOK.yml -K --extra-vars "hosts=local_machine"
```

To do real deployment on remote servers, using the following command:

```bash
# TARGET is hosts or name in the inventory.
ansible-playbook -i hosts PLAYBOOK.yml -K --extra-vars "hosts=TARGET"
```

## NOTE
`vim74.tar.gz` is the compiled source for cutting-edge vim usage. Remember to
recompile it when use these playbooks in new platform.

`fcitx.tar.gz` is the config files for fctix usage, which contains my input
method history. Remember to check on the most recently one in dropbox. So are
vimrc, bashrc etc..
