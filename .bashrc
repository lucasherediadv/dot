#!/bin/bash
#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI commands
set -o vi

# --------------- Prompt --------------- 

PS1='\w\n\\$ '

# --------------- Environment variables --------------- 

unset HISTFILE
export VISUAL=vi
export EDITOR=vi
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export SCRIPTS="$GHREPOS/scr/bin"

# --------------- Path --------------- 

export PATH=$PATH:"$SCRIPTS"

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
alias dot='/usr/bin/git --git-dir=$GHREPOS/dot --work-tree=$HOME'
alias c='clear'
alias ls='ls -h --color=auto'
alias me='cd $GHREPOS'
alias scr='cd $SCRIPTS'
alias zet='cd $GHREPOS/zet/docs'
alias hl='cd $GHREPOS/homelab'
alias lab='cd $GHREPOS/lab'
