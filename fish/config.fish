if status is-interactive
  # Init starship
  starship init fish | source

  # Setup fzf
  fzf --fish | source

  # Setup zoxide
  zoxide init fish | source
  set -Ux _ZO_ECHO 1
  set -Ux _ZO_RESOLVE_SYMLINKS 1

  # Custom cursor style on vi-mode
  set fish_cursor_default block
  set fish_cursor_insert block
  set fish_cursor_replace_one underscore
  set fish_cursor_replace underscore
  set fish_cursor_external block
end
