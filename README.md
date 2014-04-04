# Playbooks locally and remotely

The playbooks in the repo can handle the following need:
1. setting up ubuntu 12.04 from fresh installation on local machine and remote
   machines, which also includes personal config in home folder.
2. Do some adhoc command on remote machine:
  1. `./adhoc/check_alive.yml`: check which machines has down.
  2. `./adhoc/add_shawn_as_sysadmin_on_servers.yml`: what the title implies.

TODO: instructions.

TODO: format of hosts file..

```bash
├── set_up_system_desktop_part  # For setting up desktop part of the os.
│   └── tasks
│       └── main.yml
├── set_up_system_server_part   # For setting up the part does not need desktop.
│   ├── files
│   │   ├── install_vim.sh
│   │   ├── sources.list
│   │   ├── sources.list.d
│   │   │   └── ubuntu-toolchain-r-test-precise.list
│   │   │   └── ...
│   │   ├── trusted.gpg
│   │   └── vim74.tar.gz
│   └── tasks
│       └── main.yml
└── shawn_init                  # For user customization. Note some files are hidden.
    ├── files
        │   ├── fcitx.tar.gz
            │   ├── gitconfig
                │   └── gitignore
                    └── tasks
                            └── main.yml
```

## NOTE
`vim74.tar.gz` is the compiled source for cutting-edge vim usage. Remember to
recompile it when use these playbooks in new platform.

`fcitx.tar.gz` is the config files for fctix usage, which contains my input
method history. Remember to check on the most recently one in dropbox. So are
vimrc, bashrc etc..

Role `hadoop` is not finished yet.
