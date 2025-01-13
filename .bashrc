#!/bin/bash
# shellcheck disable=SC1090,SC1091

[[ $- != *i* ]] && return # if not running interactively, don't do anything

# -------------------------- local utility functions --------------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ---------------------------------- prompt ----------------------------------

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

# --------------------------- environment variables --------------------------

unset HISTFILE
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOT="$GHREPOS/dot"
export SCRIPTS="$DOT/scripts"
export BROWSER=firefox
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

_have "more" && export PAGER=more
_have "less" && export PAGER=less && export LESS="-FXR" && export LESSHISTFILE="/dev/null"

# use this instead of many aliases
# be caution not to include too many directories here
export CDPATH=".:$HOME:$REPOS:$GHREPOS:$DOT"

# ----------------------------------- path -----------------------------------

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

# ---------------------------- bash shell options ----------------------------

set -o vi
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s checkwinsize
shopt -s expand_aliases

# ------------------------------ stty annoyances -----------------------------

stty -ixon # disable control-s/control-q tty flow control

# ---------------------------------- aliases ---------------------------------

unalias -a
alias ls='ls -h --color=auto'
alias todo='$EDITOR ~/.todo'

set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  export GH_EDITOR="$1"
  export GIT_EDITOR="$1"
  alias vi="\$EDITOR"
}

_have "vi" && set-editor vi
_have "vim" && set-editor vim
_have "nvim" && set-editor nvim

# ----------------- source external dependencies / completion ----------------

_source_if /usr/share/bash-completion/bash_completion
