#!/bin/bash
# shellcheck disable=SC1090,SC1091

case $- in
*i*) ;; # Interactive
*) return ;;
esac

# ---------------------- Local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- Environment variables ----------------------

export LANG=en_US.UTF-8
export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export HELP_BROWSER=w3m
export PAGER=less
export LESS="-FXR"
export LESSHISTFILE=/dev/null
export SYSTEMD_LESS="-FRXMK"
export HRULEWIDTH=73
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export GOTELEMETRY=off
export GOPROXY=direct
export CGO_ENABLED=0

# gruvbox-material
export LS_COLORS="di=38;5;245:fi=38;5;223:ln=38;5;179:ex=38;5;108:*.txt=38;5;223"
export LESS="-FXR"
export LESS_TERMCAP_md=$'\e[1;33m'       # start bold (yellow)
export LESS_TERMCAP_mb=$'\e[1;35m'       # start blinking (magenta)
export LESS_TERMCAP_me=$'\e[0m'          # end bold/blinking
export LESS_TERMCAP_so=$'\e[38;5;108;1m' # start standout (green bold)
export LESS_TERMCAP_se=$'\e[0m'          # end standout
export LESS_TERMCAP_us=$'\e[4m'          # start underline
export LESS_TERMCAP_ue=$'\e[0m'          # end underline

# ----------------------------- Dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# ------------------------------- Path -------------------------------

pathappend() {
  declare arg
  for arg in "$@"; do
      test -d "$arg" || continue
      PATH=${PATH//":$arg:"/:}
      PATH=${PATH/#"$arg:"/}
      PATH=${PATH/%":$arg"/}
      export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export -f pathappend

pathappend \
  "$GOROOT/bin" \
  "$SCRIPTS" \
  "$GOBIN"

# ------------------------------ CDPATH ------------------------------

export CDPATH=".:$HOME:$REPOS/github.com:$GHREPOS:$DOTFILES"

# ------------------------ Bash shell options ------------------------

shopt -s expand_aliases
shopt -s checkwinsize
shopt -s dirspell
shopt -s globstar
shopt -s cdspell
shopt -s dotglob
shopt -s extglob

# -------------------------- stty annoyances -------------------------

stty -ixon # Disable control-s/control-q tty flow control

# ------------------------------ History -----------------------------

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL="erasedups:ignoreboth"

set -o vi
shopt -s histappend

# --------------------------- Smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double \
    r='\[\e[31m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]' \
    g="\[\033[38;2;90;82;76m\]"

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  countme="$USER$PROMPT_AT$(hostnamectl hostname):$dir($B)\$ "

  [[ $B == master || $B == main ]] && b="$r"
  [[ -n "$B" ]] && B="$g($b$B$g)"

  short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
  long="${g}┌$u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n${g}└$p$P$x "
  double="${g}┌$u\u$g$PROMPT_AT$h\h$g:$w$dir\n${g}║$B\n${g}└$p$P$x "

  if ((${#countme} > PROMPT_MAX)); then
    PS1="$double"
  elif ((${#countme} > PROMPT_LONG)); then
    PS1="$long"
  else
    PS1="$short"
  fi

  if _have tmux && [[ -n "$TMUX" ]]; then
    tmux rename-window "$(wd)"
  fi
}

wd() {
  dir="${PWD##*/}"
  parent="${PWD%"/${dir}"}"
  parent="${parent##*/}"
  echo "$parent/$dir"
} && export wd

PROMPT_COMMAND="__ps1"

# ------------------------------ Aliases -----------------------------
#      (use exec scripts instead, which work from vim and subprocs)

unalias -a
alias ls='ls --color=auto --human-readable --classify --group-directories-first'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias env='env -u LESS_TERMCAP_mb -u LESS_TERMCAP_md -u LESS_TERMCAP_me -u LESS_TERMCAP_so -u LESS_TERMCAP_se -u LESS_TERMCAP_us -u LESS_TERMCAP_ue'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias diff='diff --color=auto'
alias more='less'
alias me='cd $GHREPOS'
alias repos='cd $REPOS/github.com'
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias todo='$EDITOR ~/.todo'
alias gitl="git log -n 5 --graph --decorate --oneline"

# Editor related
set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  export SUDO_EDITOR="$1"
  export GH_EDITOR="$1"
  export GIT_EDITOR="$1"
  alias vi="\$EDITOR"
}
_have "vi" && set-editor vi
_have "vim" && set-editor vim
_have "nvim" && set-editor nvim

# ----------------------------- Functions ----------------------------

clone() {
  local repo="$1" user
  local repo="${repo#https://github.com/}"
  local repo="${repo#git@github.com:}"
  if [[ $repo =~ / ]]; then
    user="${repo%%/*}"
  else
    user="$GITUSER"
    [[ -z "$user" ]] && user="$USER"
  fi
  local name="${repo##*/}"
  local name="${name%.git}"
  local userd="$REPOS/github.com/$user"
  local path="$userd/$name"
  [[ -d "$path" ]] && cd "$path" && return
  mkdir -p "$userd"
  cd "$userd"
  echo gh repo clone "$user/$name" -- --recurse-submodule
  gh repo clone "$user/$name" -- --recurse-submodule
  cd "$name"
} && export -f clone

# ------------- Source external dependencies / Completion ------------

_source_if "/usr/share/bash-completion/bash_completion"
_source_if "$HOME/.bash_private"
