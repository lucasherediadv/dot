#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI commands
set -o vi

# Prompt
PS1='\w $ '

# Environment variables
unset HISTFILE
export EDITOR=vim
export VISUAL=vim
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export SCRIPTS="$GHREPOS/scr/bin"
export LESSHISTFILE=/dev/null

# Path
export PATH=$PATH:$SCRIPTS

# Aliases
unalias -a
alias dot='/usr/bin/git --git-dir=/home/user/.dot --work-tree=$HOME'
alias ls='ls -h --color=auto'
alias gr='cd $GHREPOS'
alias sr='cd $SCRIPTS'
alias todo='vim ~/.todo.md'
