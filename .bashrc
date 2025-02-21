#!/bin/bash

set +h
umask 022
#LFS=/mnt/LFS
LC_ALL=POSIX
#LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin:/usr/sbin:/usr/local/bin${PATH:+:${PATH}}
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
#PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site

HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


if [ -f ~/setenv.sh ]; then
  if [ -f /usr/local/bin/thisroot.sh ]; then
    . ~/setenv.sh
  fi
fi

source ~/Termux-Udocker/source.env


export PS1="\w>"
export PATH="/data/data/com.termux/files/usr/lib/heroku/bin:$PATH"

export JAVA_HOME=${PREFIX}/opt/openjdk
export PATH=${PREFIX}/opt/openjdk/bin:${PATH}
export ANDROID_SDK_ROOT=${HOME}/android-sdk
export ANDROID_HOME=${HOME}/android-sdk

export PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${PATH}

sshd
