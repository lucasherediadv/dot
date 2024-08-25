#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI commands
set -o vi

# Prompt
PS1='\w\n\\$ '

# Environment variables
unset HISTFILE
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export SCRIPTS="$GHREPOS/scr/bin"

# PATH
export PATH=$PATH:"$SCRIPTS"

# Aliases
unalias -a
alias dot='/usr/bin/git --git-dir=$GHREPOS/dot --work-tree=$HOME'
alias c='clear'
alias ls='ls -h --color=auto'
alias me='cd $GHREPOS'
alias scr='cd $SCRIPTS'
alias zet='cd $GHREPOS/zet/docs'
alias hl='cd $GHREPOS/homelab'
alias lab='cd $GHREPOS/lab'
