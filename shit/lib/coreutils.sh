#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash core-utils                                      #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_COREUTILS="coreutils"


#==============================================================#
#                              ls                              #
#==============================================================#
if ls --color > /dev/null 2>&1; then         # GNU flavor
    colorflag="--color"
else                                         # Darwin flavor
    colorflag="-G"
fi

alias sl=ls
alias ll="ls -lh ${colorflag}"
alias l="ls -lh ${colorflag}"
alias la="ls -lha ${colorflag}"
alias lsa="ls -a ${colorflag}"
alias ls="command ls ${colorflag}"
alias lsd="ls -lh ${colorflag} | grep --color=never '^d'"   # List only directories
if [ "${TERM}" != "dumb" ]; then
    if [ -e "$HOME/.dircolors" ]; then
        eval "`dircolors -b $HOME/.dircolors`"
    else
        export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:\ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
    fi
fi
#==============================================================#


#==============================================================#
#                              cd                              #
#==============================================================#
alias ~="cd ~"
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias cd...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
#==============================================================#



#==============================================================#
#                             grep                             #
#==============================================================#
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
#==============================================================#



#==============================================================#
#                             vim                              #
#==============================================================#
function v() {
    if [ $# -eq 0 ]; then
        vim .;
    else
        vim "$@";
    fi;
}

alias vi="vim"
alias svim="sudo vim"
alias vvim='vim ${HOME}/.vimrc'
alias vbrc='vim ${HOME}/.bashrc'
alias vbpf='vim ${HOME}/.bash_profile'
alias vssh='vim ${HOME}/.ssh/config'
alias vhst='sudo vim /etc/hosts'
#==============================================================#



#==============================================================#
#                             Admin                            #
#==============================================================#
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

#--------------------------------------------------------------#
# file back up with timestamp
function buf ()
{
    local filename=$1
    local filetime=$(date +%Y%m%d_%H%M%S)
    cp -r "${filename}" "${filename}_${filetime}"
}

#--------------------------------------------------------------#
# file size
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* *;
    fi;
}
#--------------------------------------------------------------#
# disk free
alias df="df -h"
#==============================================================#



#==============================================================#
#                             Git                              #
#==============================================================#
alias gst="git status"
alias gci="git commit"
alias gpu="git push origin master"
# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@";
    }
fi;
#--------------------------------------------------------------#



#==============================================================#
#                             misc                             #
#==============================================================#
# bash
alias q='exit'
alias j="jobs"
alias h="history"
alias hg="history | grep --color=auto "
alias cl="clear"
alias clc="clear"
alias rf="rm -rf"
alias ax="chmod a+x";
alias suod='sudo '
alias adm="sudo su admin";
alias admin="sudo su admin";
alias psa="ps aux | grep "
#--------------------------------------------------------------#
function mkcd ()
{
    mkdir -p -- "$@" && eval cd -- "\"\$$#\""
}
#--------------------------------------------------------------#
# Map function:  ls . | map ls -al
alias map="xargs -n1"
#--------------------------------------------------------------#
# tmux
alias tm="tmux"
alias tma="tmux a -t 0"
#--------------------------------------------------------------#
# ring bell
alias ring="tput bel"
#--------------------------------------------------------------#
# reload shell
alias reload="exec $SHELL -l"
#--------------------------------------------------------------#
# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

#--------------------------------------------------------------#
# calculator
function calc() {
    local result="";
    result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";
    if [[ "$result" == *.* ]]; then
        printf "$result" |
        sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
            -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
            -e 's/0*$//;s/\.$//';  # remove trailing zeros
    else
        printf "$result";
    fi;
    printf "\n";
}
#==============================================================#


