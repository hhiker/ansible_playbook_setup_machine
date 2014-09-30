# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Here begins customized configurations.
## begin alias ==============================================================
alias v="vim"
alias du="du -h"
alias ll="ls -lha"
alias n="nautilus ."
alias py="python"
## end alias ================================================================

## begin user PATH ==========================================================
export PATH="$PATH:~/mine/bin/"
## end user PATH ============================================================

## begin env setting ========================================================
### Setting for default editor.
#### The default editor I use is vim.
#### Define the absolute path of vim, thus to make the update of vi easier.
# export VIM=/usr/bin
# export VIMRUNTIME=/usr/share/vim/vim73
# export VIM="/usr/local/bin/"
# export VIMRUNTIME="/usr/local/share/vim/vim74/"
#### Two variables concerning default editor of linux.
# export EDITOR=$VIM/vim
# export VISUAL=$VIM/vim
#### The default editor defined for git.
export GIT_EDITOR=vim

source ~/mine/softwares/ansible/hacking/env-setup
source /etc/profile.d/rvm.sh
## end env setting ==========================================================

## begin color config for ls ================================================
export LS_COLORS=$LS_COLORS:'di=0;35'
## end color config for ls ==================================================

## for viewing apt, dpkg, aptitude log ======================================
function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}
## for viewing apt, dpkg, aptitude log ======================================

# my system environment--------------------------------------------------
SOFTWARES_PATH=$HOME/mine/softwares

export PATH=${SOFTWARES_PATH}/jdk1.7.0_40/bin:$PATH
export PATH="$PATH:${SOFTWARES_PATH}/google_appengine/"
export PATH=$PATH:${SOFTWARES_PATH}/latex/bin/x86_64-linux/
export PATH="$PATH:${SOFTWARES_PATH}/bin/"
export PATH="$PATH:${SOFTWARES_PATH}/apache2/bin/"
export PATH="$PATH:${SOFTWARES_PATH}/apache-ant-1.9.2/bin/"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="${SOFTWARES_PATH}/oprofile/bin:$PATH"
export PATH="${SOFTWARES_PATH}/android-sdk-linux/platform-tools/:$PATH"
export PATH="${SOFTWARES_PATH}/android-sdk-linux/tools/:$PATH"
export PATH="${SOFTWARES_PATH}/mendeley/mendeleydesktop-1.11-linux-x86_64/bin/:$PATH"
export PATH="/usr/local/rvm/gems/ruby-2.1.2/bin:$PATH"

export MANPATH="$MANPATH:${SOFTWARES_PATH}/latex/texmf/doc/man/"
export MANPATH="$MANPATH:${SOFTWARES_PATH}/apache2/man/"
export MANPATH="$MANPATH:${SOFTWARES_PATH}/jdk1.7.0_40/man/"
export MANPATH="$MANPATH:${SOFTWARES_PATH}/oprofile/share/man"

# my alias --------------------------------------------------
alias df='df -h'
alias cdai="cd /windows/out_of_mediocrity/artificial_intelligence/"
alias cdmu="cd /windows/requiescat_in_pace/database/music/"
alias cdvi="cd /windows/requiescat_in_pace/database/video/"
alias cdos="cd /windows/out_of_mediocrity/computer/os/linux/linux/"
alias cdso="cd /windows/out_of_mediocrity/social_science/"
alias cdcu="cd /windows/out_of_mediocrity/curriculum_materials/"
alias cdou="cd /windows/out_of_mediocrity/"
alias du="du -h"
alias ll="ls -lha"
alias n="nautilus ."
alias py="python"
alias v="vim"
alias e="emacs -nw"
alias mysql="mysql -u shawn -p --pager=less --local-infile=1 travel_reservation"
alias mysqlu="mysql -u root -p --pager=less --local-infile=1"
# my alias --------------------------------------------------

# For wine =====================================================
alias foxit='wine /home/shawn/.wine/drive_c/Program\ Files\ \(x86\)/Foxit\ Software/Foxit\ Reader/Foxit\ Reader.exe'
