#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash compress util                                   #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_COMPLETION="completion"

#==============================================================#
#                           Completion                         #
#==============================================================#
# git completion
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# ssh hostname
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# tab completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults;

# `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
#==============================================================#