#!/bin/bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

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
export EDITOR=nvim
export VISUAL=nvim
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export SCRIPTS="$GHREPOS/scr/bin"
export DOT="$GHREPOS/dot"
export ZET="$GHREPOS/zet/docs"
export LESSHISTFILE=/dev/null

# path
export PATH=$PATH:$SCRIPTS

# aliases
unalias -a
alias ls='ls -h --color=auto'
alias vi='nvim'
alias gr='cd $GHREPOS'
alias sr='cd $SCRIPTS'
alias dot='cd $DOT'
alias zet='cd $ZET'
alias todo='$EDITOR ~/.todo'
