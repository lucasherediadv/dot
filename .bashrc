#!/bin/bash
# shellcheck disable=SC1090,SC1091

case $- in
*i*) ;; # interactive
*) return ;;
esac

# prompt
PS1='[\u@\h \W]\$ '

# environment variables
unset HISTFILE
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export LESS="-FXR"
export LESSHISTFILE="/dev/null"
export REPOS="$HOME/repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOT="$GHREPOS/dot"
export SCRIPTS="$DOT/scripts"
export GOTELEMETRY=off
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export CDPATH=".:$HOME:$REPOS/github.com:$GHREPOS:$DOT"

# path
pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//":$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export -f pathappend

pathappend \
  "$SCRIPTS" \
  "$GOBIN"

# aliases
unalias -a
alias vi='$EDITOR'
alias ls='ls --color=auto'
alias todo='$EDITOR ~/.todo'
