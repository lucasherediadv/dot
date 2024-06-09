#!/bin/bash
#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI commands
set -o vi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~ 

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

if [[ -f ~/.config/git/git-prompt.sh ]]; then
  source ~/.config/git/git-prompt.sh
fi

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\w${PS1_CMD1}\n\$ '

# ~~~~~~~~~~~~~~~ Environment variables ~~~~~~~~~~~~~~~ 

export VISUAL=vim
export EDITOR=vim

# Directories
export GHREPOS="$HOME/repos/github.com/lucasherediadv"
export SCRIPTS="$GHREPOS/scr"

# Go related
export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"

# Disable history file
unset HISTFILE

# ~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~ 

PATH=$PATH:"$SCRIPTS":"$GOBIN"
export PATH

# ~~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~ 

if [ -f ~/.ssh/agent.env ] ; then
  source ~/.ssh/agent.env > /dev/null
  if ! kill -0 "$SSH_AGENT_PID" > /dev/null 2>&1; then
    echo "Stale agent file found. Spawning a new agent."
    eval "$(ssh-agent | tee ~/.ssh/agent.env)"
    ssh-add
  fi
else
  echo "Starting ssh-agent"
  eval "$(ssh-agent | tee ~/.ssh/agent.env)"
  ssh-add
fi

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~ 

# Remove previous aliases
unalias -a

# System
alias bye="sudo shutdown -h now"
alias reboot="sudo reboot"
alias up="sudo dnf upgrade"
alias c="clear"
alias e="exit"
alias v="vim"

# Directories
alias repos='cd $GHREPOS'
alias scr='cd $GHREPOS/scr'
alias lab='cd $GHREPOS/lab'
alias to="v ~/.todo.md"

# ls
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -hall"

# Git
alias gs="git status"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gff="git diff"
alias gb="git branch --all"

# Dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/repos/github.com/lucasherediadv/dot --work-tree=$HOME'
alias ds="dot status"
alias da="dot add"
alias dm="dot commit -m"
alias dp="dot push"
alias dff="dot diff"
