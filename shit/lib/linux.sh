#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Linux specific bash util                             #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_DARWIN="darwin"


#==============================================================#
#                          Systemctl                           #
#==============================================================#
alias sc='systemctl'
alias scr='systemctl daemon-reload'
alias scu='systemctl --user'
alias scur='systemctl --user daemon-reload'
alias sce='systemctl stop'
alias scue='systemctl --user stop'
alias scs='systemctl start'
alias scus='systemctl --user start'
#==============================================================#