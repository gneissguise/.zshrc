#!/bin/bash

function cdrg() {
   if [ "$1" != "" ]; then
        cd $GATELESS/$1 || return
    else
        cd $GATELESS || return
    fi
}

_cdrg() {
  local -a repos
  local -a project
  local -a gitdir
  for d in $GATELESS/*/ ; do
    if [ -d "$d" ]; then
      project=$(basename $d)
      gitdir="$d/.git"
      if [ -d git-dir ]; then
        # repos+="$project:[$project/$(git --git-dir=$d/.git symbolic-ref --short HEAD)]"
        repos+="$project:[$project/$(git --git-dir=$gitdir rev-parse --short HEAD 2> /dev/null)]"
      else
        repos+="$project:[$project/main]"
      fi
    fi
  done
  _describe "cdrg" repos
}

compdef _cdrg cdrg
