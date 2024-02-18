# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Minimal prompt
PS1="\w $ "

# Enable vi navigation
set -o vi

# ------------ Aliases ---------------

# Alias to manage my dotfiles with a git bare repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias todo="nvim TODO.md"
alias pp="cd ~/Documents/python_projects"
alias venv="source .venv/bin/activate"

alias n=nvim
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias e="exit"

alias l="ls -l"
alias ll="ls -all"

alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gp='git push'

# ---------- History ----------------

HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000
shopt -s histappend

# ----------- Node Version Manager --------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

