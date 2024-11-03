#!/bin/bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# use vi commands
set -o vi

# smart prompt (stolen from rwxrob)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double

  [[ $EUID == 0 ]] && P='#' 
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  countme="$USER$PROMPT_AT$(hostnamectl hostname):$dir($B)\$ "

  [[ $B == master || $B == main ]] 
  [[ -n "$B" ]] && B="($B)"

  short="\u$PROMPT_AT\h:$dir$B$P "
  long="┌\u$PROMPT_AT\h:$dir$B\n└$P "
  double="┌\u$PROMPT_AT\h:$dir\n|$B\n└$P "

  if ((${#countme} > PROMPT_MAX)); then
    PS1="$double"
  elif ((${#countme} > PROMPT_LONG)); then
    PS1="$long"
  else
    PS1="$short"
  fi
}

PROMPT_COMMAND="__ps1"

# environment variables
unset HISTFILE
export EDITOR=vi
export VISUAL=vi
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
alias gr='cd $GHREPOS'
alias sr='cd $SCRIPTS'
alias dot='cd $DOT'
alias zet='cd $ZET'
alias todo='vi ~/.todo'
