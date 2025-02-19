#!/bin/bash

alias ve='python3 -m virtualenv ./venv'
alias va='source ./venv/bin/activate'

#alias lsh=’ls -d .* --color=auto’
alias lst='ls -t -1'
alias ll='ls -lh'
alias la='ls -la'
alias l='ls -F'
alias llt='ls --human-readable --size -1 -S --classify'

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"


alias dus='du -sh * | sort -h'
alias updg='apt update && apt upgrade'
alias py='python'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias ipls="curl ipinfo.io/ip"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rmi='rm -i'
alias tkn="cat ~/mywrk/token.txt"

alias ps="ps ax | sed -e 's#/data/data/com.termux/files##g' | fzf"
alias wget='wget -c'
alias df='df -H |column -t | fzf'
alias du='du -ch'
alias free='free -h |column -t | fzf'

# git
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'

alias gs="git status"
alias gst="git status -sb"
alias gl="git log"
alias ga="git add"
alias gaa="git add -A"
alias gal="git add ."
alias gall="git add ."
alias gca="git commit -a"
alias gc="git commit -m"
alias gckout="git checkout"
alias go="git push -u origin"
alias gsh='git stash'
alias gw='git whatchanged'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias pdg='cat ~/mywrk/token.txt; ~/mywrk/pdg.sh'
alias gpps='cat ~/mywrk/token.txt; ~/mywrk/gpps.sh'

alias fcd='`__fzf_cd__`'
alias fq='fzf -q'

fnd() {
  find "$1" -name "$2" -type f ! -path "*/.*" | fzf
}

source /data/data/com.termux/files/usr/share/fzf/completion.bash

source /data/data/com.termux/files/usr/share/fzf/key-bindings.bash


