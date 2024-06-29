#!/bin/bash
#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI commands
set -o vi

# --------------- Prompt --------------- 

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

if [[ -f ~/.config/git/git-prompt.sh ]]; then
  source ~/.config/git/git-prompt.sh
fi

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\w${PS1_CMD1}\n\$ '

# --------------- Environment variables --------------- 

export VISUAL=vi
export EDITOR=vi
export GHREPOS="$HOME/Repos/github.com/lucasherediadv"
export SCRIPTS="$GHREPOS/scr"
export ZET="$GHREPOS/zet"
export HOMELAB="$GHREPOS/homelab"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$GOPATH/bin"
unset HISTFILE

# --------------- Path --------------- 

PATH=$PATH:"$SCRIPTS":"$GOBIN"
export PATH

# --------------- SSH --------------- 

if [ -f ~/.ssh/github/agent.env ] ; then
  source ~/.ssh/github/agent.env > /dev/null
  if ! kill -0 "$SSH_AGENT_PID" > /dev/null 2>&1; then
    echo "Stale agent file found. Spawning a new agent."
    eval "$(ssh-agent | tee ~/.ssh/github/agent.env)"
    ssh-add ~/.ssh/github/id_ed25519
  fi
else
  echo "Starting ssh-agent"
  eval "$(ssh-agent | tee ~/.ssh/github/agent.env)"
  ssh-add ~/.ssh/github/id_ed25519
fi

# --------------- Aliases --------------- 

unalias -a
alias dot='/usr/bin/git --git-dir=$HOME/Repos/github.com/lucasherediadv/dot --work-tree=$HOME'
alias todo='vi ~/.todo'
alias c='printf "\e[H\e[2J"'
alias ls='ls -h --color=auto'
alias me='cd $GHREPOS'
alias zet='cd $ZET/doc'
alias hl='cd $HOMELAB'
alias scr='cd $SCRIPTS'
alias lab='cd $GHREPOS/lab'
