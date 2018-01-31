#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash Environment Variable & Settings                 #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_ENV="env"


#==============================================================#
#                         Environment                          #
#==============================================================#
# os
export OS=$(uname)
#--------------------------------------------------------------#
# editor & pager
export EDITOR="vim"
export PAGER="less"
export MANPAGER="less -X";
#--------------------------------------------------------------#
# locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
#--------------------------------------------------------------#
# env
ENV="dev"
if [ ${OS} == "Linux" ]; then
    ENV="prod"
fi
export ENV
#--------------------------------------------------------------#
# bash history
export HISTSIZE=65535;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="l:ls:cd:cd -:pwd:exit:date:* --help";

# append rather than overwrite in bash history
shopt -s histappend;
#--------------------------------------------------------------#
# man page title highlight
export LESS_TERMCAP_md="$(tput setaf 136)";
#==============================================================#



#==============================================================#
#                        Bash Options                          #
#==============================================================#
shopt -s nocaseglob;    # case-insensitive globbing
shopt -s cdspell;       # auto-correct typos in cd
set -o pipefail

# Bash 4 features
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;
#==============================================================#