#!/bin/bash

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Prompt.
export PS1="\w $ "

# Use VI commands.
set -o vi

# Disable writing the history file.
unset HISTFILE

# Environment Variables
export VISUAL=vim
export EDITOR=vim
export GHREPOS="$HOME/repos/github.com/lucasherediadv"
export SCRIPTS="$GHREPOS/scripts"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# Path configuration.
PATH=$PATH:"$SCRIPTS":"$GOBIN"
export PATH

# Aliases.
unalias -a
alias dotfiles='/usr/bin/git --git-dir=$HOME/repos/github.com/lucasherediadv/dotfiles --work-tree=$HOME'
alias repos="cd $GHREPOS"
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
alias t="tmux"
alias ts="tmux ls"
alias tk="tmux kill-session"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gff="git diff"
alias ds="dotfiles status"
alias da="dotfiles add"
alias dm="dotfiles commit -m"
alias dp="dotfiles push"
alias dff="dotfiles diff"
