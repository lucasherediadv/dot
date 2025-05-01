if status is-interactive
  # Setup starship
  starship init fish | source
  set -Ux STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"

  # Setup fzf
  fzf --fish | source
  set -Ux FZF_CTRL_R_OPTS "--no-sort --exact --border=sharp --layout=reverse --info=inline --height=45%" 

  # Setup zoxide
  zoxide init fish | source
  set -Ux _ZO_ECHO 1
  set -Ux _ZO_RESOLVE_SYMLINKS 1

  # Colored man pages with bat
  set -Ux MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat --theme-dark=gruvbox-dark -p -lman'"

  # Custom cursor style on vi-mode
  set fish_cursor_default block
  set fish_cursor_insert block
  set fish_cursor_replace_one underscore
  set fish_cursor_replace underscore
  set fish_cursor_external block

  # Editor and Pager
  set -Ux EDITOR nvim
  set -Ux VISUAL nvim
  set -Ux PAGER less
  set -Ux LESS "-FXR"

  # Repositories
  set -Ux REPOS "$HOME/repos"
  set -Ux GITUSER "lucasherediadv"
  set -Ux GHREPOS "$REPOS/github.com/$GITUSER"
  set -Ux DOTFILES "$GHREPOS/dotfiles"
  set -Ux SCRIPTS "$DOTFILES/scripts"

  # Go related
  set -Ux GOTELEMETRY off
  set -Ux GOPATH "$HOME/go"
  set -Ux GOBIN "$GOPATH/bin"

  # Dotnet
  set -Ux DOTNET_CLI_TELEMETRY_OPTOUT 1

  # Append entries to PATH
  set -U fish_user_paths $fish_user_paths "$SCRIPTS" "$GOBIN"
end
