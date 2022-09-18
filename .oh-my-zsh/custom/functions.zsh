#!/usr/bin/env zsh

function dotimes() {
  for i in {1..$1}; do ${@:2}; done;
}
alias dt="dotimes"

timestamp() {
  date "+%Y%m%d-%H%M%S"
}
alias ts="timestamp"

timestamp-utc() {
  date -u "+%Y-%m-%dT%H:%M:%S%Z"
}
alias utc="timestamp-utc"

## My super cool backup fn
bak() {
  ts="$(timestamp)" # Only run timestamp once per iteration
  for var in "$@"; do
    [[ -f "$var" ]] && cp "$var" "$var.$ts.bak" && echo "Successfully backed up $var -> $var.$ts.bak" || echo "Error backing up to: $var.$ts.bak"
  done
}

## Changes a file suffix
sfx() {
  for var in "${@:2}"; do
    rnv="${var%.*}" # Only run parameter expansion once per iteration
    [[ -f "$var" ]] && mv "$var" "$rnv.$1" && echo "Successfully renamed $var -> $rnv.$1" || echo "Error renaming to: $rnv.$1"
  done
}

## Append a file suffix, you crazy card
tak() {
  for var in "${@:2}"; do
    [[ -f "$var" ]] && mv "$var" "$var.$1" && echo "Successfully renamed $var -> $var.$1" || echo "Error renaming to: $var.$1"
  done
}
for f in $ZSH_CUSTOM/functions/*(N); do source $f; done
export FPATH=$ZSH_CUSTOM/functions:$FPATH
