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

# Disable writing the history file.
unset HISTFILE

# Aliases.
unalias -a
alias dotfiles='/usr/bin/git --git-dir=$HOME/repos/github.com/lucasherediadv/dotfiles --work-tree=$HOME'
alias me="cd ~/repos/github.com/lucasherediadv"
alias to="v ~/.todo.md"
alias ls="ls --color=auto"
alias ll="ls -la"
alias la="ls -A"
alias bye="sudo shutdown -h now"
alias reboot="sudo reboot"
alias up="sudo dnf upgrade"
alias c="clear"
alias e="exit"
alias v="vim"
alias t="tmux"
alias ts="tmux ls"
alias tk="tmux kill-session"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gf="git diff"
alias ds="dotfiles status"
alias da="dotfiles add"
alias dm="dotfiles commit -m"
alias dp="dotfiles push"
alias dff="dotfiles diff"
