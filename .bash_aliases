#!/usr/bin/env bash

# Core
alias update="sudo dnf upgrade"
alias l="ls -l --color=auto"
alias ll="ls -all --color=auto"
alias tre="tree -C"
alias ..="cd .."
alias ...="cd ../.."
alias s="source"
alias c="clear"
alias e="exit"
alias mkdir="mkdir -v -p"
alias n=nvim
alias venv="source .venv/bin/activate"

# Safety features
alias mv='mv -i -v'
alias cp='cp -i -v'
alias rm='rm -i -v'

# Tmux
alias t='tmux'
alias tls="tmux ls"
alias tks='tmux kill-session'

# Files
alias todo="nvim ~/Documents/todo.md"
alias pp="cd ~/Documents/python_projects"

# Git
alias gi='git init'
alias gs='git status'
alias ga='git add'
alias gcm='git commit'
alias gp='git push'
alias gf='git diff'
alias gl='git log'

# Dot-files
alias dotfiles='/usr/bin/git --git-dir=$HOME/Documents/dotfiles/ --work-tree=$HOME'
alias ds='dotfiles status'
alias da='dotfiles add'
alias dcm='dotfiles commit'
alias dp='dotfiles push'
alias dff='dotfiles diff'
alias dl="dotfiles log"

