#!/bin/bash
# shellcheck disable=SC1090,SC1091

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
__ps1() {
  local P='$' dir="${PWD##*/}" B

  [[ $EUID == 0 ]] && P='#'
  [[ $PWD = / ]] && dir='/'
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  [[ -n "$B" ]] && B="─[$B]"

  PS1="┌[\u@\h]─[$dir]$B\n└$P "
}

PROMPT_COMMAND="__ps1"

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
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export CDPATH=".:$HOME:$GHREPOS:$DOT"

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
alias ls='ls -h --color=auto'
alias vi='$EDITOR'
alias todo='$EDITOR ~/.todo'
