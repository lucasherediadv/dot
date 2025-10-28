#!/bin/bash
# shellcheck disable=SC1090,SC1091

case $- in
*i*) ;; # Interactive
*) return ;;
esac

# ---------------------- Local utility functions ---------------------

_have() { command -v "$1" &>/dev/null; }
_source_if() { test -r "$1" && source "$1"; }

# ----------------------- Environment variables ----------------------

export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export ZETTELKASTEN="$GHREPOS/zet"

# Go
export CGO_ENABLED=0
export GOPROXY=direct
export GOTELEMETRY=off
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"

# .NET
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# ---------------------- gruvbox-material colors ---------------------

export LESS_TERMCAP_md=$'\e[1;33m'       # start bold (yellow)
export LESS_TERMCAP_mb=$'\e[1;35m'       # start blinking (magenta)
export LESS_TERMCAP_me=$'\e[0m'          # end bold/blinking
export LESS_TERMCAP_so=$'\e[38;5;108;1m' # start standout (green bold)
export LESS_TERMCAP_se=$'\e[0m'          # end standout
export LESS_TERMCAP_us=$'\e[4m'          # start underline
export LESS_TERMCAP_ue=$'\e[0m'          # end underline

export LS_COLORS="di=38;5;245:fi=38;5;223:ln=38;5;179:ex=38;5;108:*.txt=38;5;223"

# ------------------------ Vim spell directory -----------------------

[[ -d "$HOME/.vim/spell" ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# ------------------------------- Pager ------------------------------

if [[ -x /usr/bin/lesspipe ]]; then
  export LESSOPEN="| /usr/bin/lesspipe %s"
  export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

export PAGER=less
export LESS="-FXR"
export SYSTEMD_LESS="-FRXMK"
export LESSHISTFILE=/dev/null

# ----------------------------- Dircolors ----------------------------

if _have dircolors; then
  if test -r "$HOME/.dircolors"; then
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

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# Remember last argument will be first in $PATH
pathprepend \
  "$SCRIPTS"

pathappend \
  "$GOBIN" \
  "$HOME/.dotnet/tools"

# ------------------------------ CDPATH ------------------------------

export CDPATH=".:$GHREPOS:$DOTFILES:$REPOS:$HOME"

# ------------------------ Bash shell options ------------------------

shopt -s expand_aliases checkwinsize dirspell \
         globstar cdspell dotglob extglob

# -------------------------- stty annoyances -------------------------

stty -ixon # Disable control-s/control-q tty flow control

# ------------------------------ History -----------------------------

# Huge history. Doesn't appear to slow things down, so why not?
export HISTSIZE=500000
export HISTFILESIZE=100000

# Avoid duplicate entries
export HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Record each line as it gets issued
export PROMPT_COMMAND="history -a"

# Use standard ISO 8601
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

set -o vi
shopt -s cmdhist    # Save multi-line commands as one command
shopt -s histappend # Append to the history file, don't overwrite it

# --------------------------- Smart prompt ---------------------------
#                 (Keeping in bashrc for portability)

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

PROMPT_COMMAND+="; __ps1"

# ------------------------------ Aliases -----------------------------
#      (Use exec scripts instead, which work from vim and subprocs)

unalias -a
alias '?'='gpt'
alias ls='ls --color=auto --human-readable --classify --group-directories-first'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias env='env -u LESS_TERMCAP_mb -u LESS_TERMCAP_md -u LESS_TERMCAP_me -u LESS_TERMCAP_so -u LESS_TERMCAP_se -u LESS_TERMCAP_us -u LESS_TERMCAP_ue'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias du='du -h'
alias df='df -h'
alias chmox='chmod +x'
alias free='free -h'
alias tree='tree --dirsfirst -C -a -I .git/'
alias diff='diff --color=auto'
alias more='less'
alias temp='cd $(mktemp -d)'

# ------------------------------ Editor ------------------------------

set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  export SUDO_EDITOR="$1"
  export GH_EDITOR="$1"
  export GIT_EDITOR="$1"
  alias vi="\$EDITOR"
} && export -f set-editor

if _have "vim"; then
  set-editor vim
elif _have "vi"; then
  set-editor vi
fi

# ----------------------------- Functions ----------------------------

envx() {
	local envfile="${1:-"$HOME/.env"}"
	[[ ! -e "$envfile" ]] && echo "$envfile not found" && return 1
	while IFS= read -r line; do
		name=${line%%=*}
		value=${line#*=}
		[[ -z "${name}" || $name =~ ^# ]] && continue
		export "$name"="$value"
	done <"$envfile"
} && export -f envx

[[ -e "$HOME/.env" ]] && envx "$HOME/.env"

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

mkcd() {
    mkdir -p -- "$1" || return
    # shellcheck disable=SC2164
    cd -- "$1"
}

# ------------- Source external dependencies / Completion ------------

_have yq && . <(yq completion bash)
_have dyff && . <(dyff completion bash)
_have glow && . <(glow completion bash)
_have mods && . <(mods completion bash)
_have gh && . <(gh completion --shell bash)
_have podman && . <(podman completion bash)
_have pandoc && . <(pandoc --bash-completion)
_have docker && _source_if "$HOME/.local/share/docker/completion" # d
_source_if "/usr/share/bash-completion/bash_completion"

# Bash parameter completion for the dotnet CLI
if _have dotnet; then
  function _dotnet_bash_complete()
  {
    local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
    local candidates
    read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
    read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
  }
  complete -f -F _dotnet_bash_complete dotnet
fi

# -------------------- Personalized configuration --------------------

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"

_have terraform && complete -C /usr/bin/terraform terraform
_have terraform && complete -C /usr/bin/terraform tf
