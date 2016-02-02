#!/bin/bash

# exit on error
set -e

# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget -O tmux-1.8.tar.gz http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.8/tmux-1.8.tar.gz?r=http%3A%2F%2Ftmux.sourceforge.net%2F&ts=1370696482&use_mirror=heanet
wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

############
# ncurses #
############
tar xvzf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/local
make
make install
cd ..

############
# tmux #
############
tar xvzf tmux-1.8.tar.gz
cd tmux-1.8
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..

# cleanup
rm -rf $HOME/tmux_tmp

echo 'export PATH="$PATH:$HOME/local/bin"' >> "$HOME/.bashrc"
echo "$HOME/local/bin/tmux is now available. $HOME/local/bin is added to your PATH."
