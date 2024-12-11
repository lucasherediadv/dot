#!/bin/bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# local utility function
_have() { type "$1" &>/dev/null; }

# use vi commands
set -o vi

# prompt
__ps1() {
  local P='$' dir="${PWD##*/}" B

  [[ $EUID == 0 ]] && P='#' 
  [[ $PWD = / ]] && dir='/'
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  [[ -n "$B" && ($B == master || $B == main) ]] && B="─[$B]"

  PS1="┌[\u@\h]─[$dir]$B\n└$P "
}

PROMPT_COMMAND="__ps1"

# environment variables
unset HISTFILE
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOT="$GHREPOS/dot"
export SCRIPTS="$DOT/scripts"
export ZET="$GHREPOS/zet/docs"
export LESSHISTFILE=/dev/null

# path
export PATH=$PATH:$SCRIPTS

# aliases
unalias -a
alias ls='ls -h --color=auto'
alias gr='cd $GHREPOS'
alias sr='cd $SCRIPTS'
alias dot='cd $DOT'
alias zet='cd $ZET'
alias todo='$EDITOR ~/.todo'

_have "vim" && alias vi=vim && export EDITOR=vim && export VISUAL=vim
_have "nvim" && alias vi=nvim && export EDITOR=nvim && export VISUAL=nvim
