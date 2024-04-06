# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically start ssh-agent if not already running
# https://yashagarwal.in/notes/setting-up-ssh-agent-in-i3
if [ -f ~/.ssh/agent.env ] ; then
  . ~/.ssh/agent.env > /dev/null
  if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
    echo "Stale agent file found. Spawning a new agent. "
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
  fi
else
  echo "Starting ssh-agent"
  eval `ssh-agent | tee ~/.ssh/agent.env`
  ssh-add
fi

# Prompt
export PS1="\w $ "

# Options
set -o vi

# History
export HISTSIZE=0

# Aliases
unalias -a
alias d="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias todo="vim $HOME/.todo.md"
alias ls="ls --color=auto"
alias c="clear"

