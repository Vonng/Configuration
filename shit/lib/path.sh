#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : Bash Network Util                                    #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_PATH="PATH"

#==============================================================#
#                              Go                              #
#==============================================================#
GOROOT=${GOROOT:=/usr/local/go}
if [[ -d $GOROOT ]]; then
    export GOROOT
    PATH="${GOROOT}/bin:${PATH}"
else
    unset GOROOT
fi
#--------------------------------------------------------------#
GOPATH=${GOPATH:=${HOME}/go}
if [[ -d $GOPATH ]]; then
    export GOPATH
    PATH="${GOPATH}/bin:${PATH}"
else
    if [[ -d ${HOME}/Dev/go ]]; then
        export GOPATH=${HOME}/Dev/go
    else
        unset GOPATH
    fi
fi
#==============================================================#



#==============================================================#
#                            Postgres                          #
#==============================================================#
PG_HOME=${PG_HOME:="/usr/local/pgsql"}
if [[ -d $PG_HOME ]]; then
    PATH="${PG_HOME}/bin:${PATH}"
else
    unset PG_HOME
fi
#==============================================================#



#==============================================================#
#                             Python                           #
#==============================================================#
# anaconda
PYTHONHOME=${PYTHONHOME:="${HOME}/anaconda"}
if [[ -d $PYTHONHOME ]]; then
    export PYTHONHOME
    PATH="${PATH}":${PYTHONHOME}/bin
else
    unset PYTHONHOME
fi
#--------------------------------------------------------------#
# alias
alias py=python
alias p="ipython"
alias qt="nohup jupyter qtconsole &"
#--------------------------------------------------------------#
# Tsinghua conda mirror
function py_config_conda(){
    conda config --add channels 'https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/'
    conda config --set show_channel_urls yes
}
#--------------------------------------------------------------#
# Tsinghua pip mirror
function py_config_pip(){
    # pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package
    mkdir -p ~/.pip/
    cat > ~/.pip/pip.conf << EOF
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
EOF
}
#==============================================================#



#==============================================================#
#                             Nginx                            #
#==============================================================#
NGINX_HOME=${NGINX_HOME:=/usr/local/nginx}
if [ -d ${NGINX_HOME} ]; then
    export NGINX_HOME
    alias nginx_conf="sudo vi ${NGINX_HOME}/nginx.conf"
    alias nginx_start="sudo ${NGINX_HOME}/nginx"
    alias nginx_reload="sudo ${NGINX_HOME}/nginx -s reload"
    PATH="$PATH:${NGINX_HOME}/bin"
else
    unset NGINX_HOME
fi
#==============================================================#



#==============================================================#
#                             Java                             #
#==============================================================#
# java
if [[ -z "${JAVA_HOME}" ]]; then
    case $(uname) in
        Darwin ) JAVA_HOME=`/usr/libexec/java_home 2>/dev/null` ;;
        Linux )  JAVA_HOME="/usr/local/java" ;;
    esac
fi

if [ -d "${JAVA_HOME}" ]; then
    export JAVA_HOME
    export CLASSPATH=".:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar"
    PATH="$PATH:${JAVA_HOME}/bin"
else
    unset JAVA_HOME
fi
#==============================================================#



#==============================================================#
#                             Node                             #
#==============================================================#
# node
NODE_HOME=${NODE_HOME:=/usr/local/node}
if [ -d ${NODE_HOME} ]; then
    PATH="$PATH:${NODE_HOME}/bin"
    alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

fi

#==============================================================#



#==============================================================#
#                             PATH                             #
#==============================================================#
export PATH=$(echo -n $PATH | tr : "\n"| uniq | tr "\n" :)
#==============================================================#