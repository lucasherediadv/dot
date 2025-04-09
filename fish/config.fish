if status is-interactive
  # Setup starship
  starship init fish | source
  set -Ux STARSHIP_CONFIG "~/.config/starship/starship.toml"

  # Setup fzf
  fzf --fish | source

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
end
