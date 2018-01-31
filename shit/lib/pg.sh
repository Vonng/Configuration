#!/usr/bin/env bash
#==============================================================#
# Author: Vonng(fengruohang@outlook.com)                       #
# Desc  : PostgreSQL Util                                      #
# Dep   : None                                                 #
#==============================================================#

# module name
declare -g -r __MODULE_PG="pg"


#==============================================================#
#                            Postgres                          #
#==============================================================#
export PGDATA="/var/lib/pgsql/data"
PGDATA=${PGDATA:=/var/lib/pgsql/data}

if [[ -d ${PGDATA} ]]; then
    export PGDATA
else
    unset PGDATA
fi
#--------------------------------------------------------------#
PGCTL=$(which pg_ctl)
#--------------------------------------------------------------#


#--------------------------------------------------------------#
# alias
alias pg_su="sudo su - postgres"
alias pg_start="${PGCTL} start -D ${PGDATA} -l ${PGDATA}/log"
alias pg_stop="${PGCTL} stop -D ${PGDATA}"
alias pg_restart="${PGCTL} restart -D ${PGDATA}"
alias pg_reload="${PGCTL} reload"
alias pg_conf="vim ${PGDATA}/postgresql.conf"
alias pg_hba="vim ${PGDATA}/pg_hba.conf"

#--------------------------------------------------------------#
# psql standard output to markdown
alias pg2md=" sed 's/+/|/g' | sed 's/^/|/' | sed 's/$/|/' |  grep -v rows | grep -v '||'"
# Usage: `psql -c 'select * from account' | pg2md`
#--------------------------------------------------------------#
# Usage: pgschema <database> <table>
function pgschema(){
    SQL="SELECT
      column_name    AS name,
      column_default AS default,
      is_nullable    AS nullable,
      udt_name       AS type
    FROM information_schema.columns
    WHERE table_name = '$2'
    ORDER BY ordinal_position;"
    psql $1 -c "${SQL}" | sed 's/+/|/g' | sed 's/^/|/' | sed 's/$/|/' |  grep -v rows | grep -v '||'
}
#==============================================================#