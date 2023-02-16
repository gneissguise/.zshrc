#!/usr/bin/env zsh

## Clojure env vars
export LEIN_USERNAME="frostjust@gmail.com"
export LEIN_PASSWORD=""
export JVM_OPTS="-Xms8g -Xmx16g"

alias rlwrap-ansi-red='rlwrap --always-readline --prompt-colour=RED --histsize 10000 -q "\""'
alias rlwrap-ansi-blue='rlwrap --always-readline --prompt-colour=BLUE --histsize 10000 -q "\""'
alias rlwrap-ansi-green='rlwrap --always-readline --prompt-colour=GREEN --histsize 10000 -q "\""'
alias rlwrap-ansi-yellow='rlwrap --always-readline --prompt-colour=YELLOW --histsize 10000 -q "\""'
alias rlwrap-ansi-magenta='rlwrap --always-readline --prompt-colour=MAGENTA --histsize 10000 -q "\""'
alias rlwrap-ansi-purple='rlwrap --always-readline --prompt-colour=PURPLE --histsize 10000 -q "\""'
alias rlwrap-ansi-cyan='rlwrap --always-readline --prompt-colour=CYAN --histsize 10000 -q "\""'
alias rlwrap-ansi-white='rlwrap --always-readline --prompt-colour=WHITE --histsize 10000 -q "\""'
alias rlwrap-ansi-black='rlwrap --always-readline --prompt-colour=BLACK --histsize 10000 -q "\""'

## Fun Clojure things
alias clj-tools='clojure -Ttools' # Then we can do `clj-tools install com.github.liquidz/antq '{:git/tag "1.2.0"}' :as antq`
alias cljt='clj-tools'
alias clj-deps-outdated='clojure -Tantq outdated'
alias clj-new='clojure -Tclj-new'
alias cljn='clj-new'
alias clj-repl='rlwrap-ansi-green clojure -M:add-libs:repl/rebel-nrepl'
alias cljr='clj-repl'
alias portal='bb -cp `clojure -Spath -M:portal/cli` -m portal.main'
alias edn='portal edn'
alias json='portal json'
alias transit='portal transit'
alias yaml='portal yaml'
alias nrepl='clj -M:nREPL -m nrepl.cmdline --socket nrepl-socket'
alias bbr='rlwrap-ansi-green bb repl'
