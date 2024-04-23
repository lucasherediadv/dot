#!/bin/bash

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Prompt.
export PS1="\w $ "

# Use VI commands.
set -o vi

# Disable writing the history file, while it still allows to cycle
# through the last commands.
unset HISTFILE

# Aliases.
unalias -a
alias d='/usr/bin/git --git-dir=$HOME/repos/github.com/lucasherediadv/dotfiles --work-tree=$HOME'
alias ls="ls --color=auto"
alias c="clear"

