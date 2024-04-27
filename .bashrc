#!/bin/bash

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Prompt.
export PS1="\w $ "

# Use VI commands.
set -o vi

# Environment Variables.
export GOPATH="$HOME/.local/share/go"

# Path configuration.
PATH=$PATH:$(go env GOPATH)/bin:"$HOME/repos/github.com/lucasherediadv/scripts"
export PATH

# Disable writing the history file, while it still allows to cycle
# through the last commands.
unset HISTFILE

# Aliases.
unalias -a
alias d='/usr/bin/git --git-dir=$HOME/repos/github.com/lucasherediadv/dotfiles --work-tree=$HOME'
alias ls="ls --color=auto"
alias ll="ls -al"
alias c="clear"
alias gs="git status"
alias ga="git add"

