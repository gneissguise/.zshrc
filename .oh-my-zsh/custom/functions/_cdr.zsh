#!/bin/bash

function cdr() {
  if [ "$1" != "" ]; then
    cd $REPOS/$1
  else
    cd $REPOS
  fi
}

_cdr() {
  compadd -- $(exa -D $REPOS)
}

compdef _cdr cdr
