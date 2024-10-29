#!/bin/bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# use VI commands
set -o vi

# prompt
PS1='\w $ '

# environment variables
unset HISTFILE
export EDITOR=vi
export VISUAL=vi
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export SCRIPTS="$GHREPOS/scr/bin"
export DOT="$GHREPOS/dot"
export LESSHISTFILE=/dev/null

# path
export PATH=$PATH:$SCRIPTS

# aliases
unalias -a
alias ls='ls -h --color=auto'
alias gr='cd $GHREPOS'
alias sr='cd $SCRIPTS'
alias dot='cd $DOT'
alias todo='vi ~/.todo'
