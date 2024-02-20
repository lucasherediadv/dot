#!/usr/bin/env bash

# Core
alias l="ls -l --color=auto"
alias ll="ls -all --color=auto"
alias tre="tree -C"
alias ..="cd .."
alias ...="cd ../.."
alias s="source"
alias c="clear"
alias e="exit"
alias mv='mv -v'
alias mv='cp -v'
alias mv='rm -v'
alias n=nvim
alias venv="source .venv/bin/activate"

# Files
alias todo="nvim Documents/TODO.md"
alias pp="cd ~/Documents/python_projects"

# Git
alias gs='git status'
alias ga='git add'
alias gcm='git commit' # I write the commit message in neovim since it has spell checker
alias gp='git push'
alias gf='git diff'
alias gl='git log'

# Dot-files
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ds='dotfiles status'
alias da='dotfiles add'
alias dcm='dotfiles commit' # Same as git commit
alias dp='dotfiles push'
alias dff='dotfiles diff'
alias dl="dotfiles log"

