#!/bin/bash

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Prompt.
export PS1='\w\n\$ '

# Use VI commands.
set -o vi

# Disable writing the history file.
unset HISTFILE

# Environment Variables
export VISUAL=vim
export EDITOR=vim
export GHREPOS="$HOME/repos/github.com/lucasherediadv"
export LAB="$GHREPOS/lab"
export SCRIPTS="$GHREPOS/scr"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"

# Path configuration.
PATH=$PATH:"$SCRIPTS":"$GOBIN"
export PATH

# Aliases.
unalias -a
alias dot='/usr/bin/git --git-dir=$HOME/repos/github.com/lucasherediadv/dot --work-tree=$HOME'
alias repos="cd $GHREPOS"
alias lab="cd $LAB"
alias to="v ~/.todo.md"
alias ls="ls --color=auto"
alias ll="ls -hall"
alias la="ls -A"
alias bye="sudo shutdown -h now"
alias reboot="sudo reboot"
alias up="sudo dnf upgrade"
alias c="clear"
alias e="exit"
alias v="vim"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gff="git diff"
alias gb="git branch --all"
alias ds="dot status"
alias da="dot add"
alias dm="dot commit -m"
alias dp="dot push"
alias dff="dot diff"
