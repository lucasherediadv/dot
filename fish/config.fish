if status is-interactive
  # Init starship
  starship init fish | source

  # Set up fzf key bindings
  fzf --fish | source

  # Custom cursor style on vi-mode
  set fish_cursor_default block
  set fish_cursor_insert block
  set fish_cursor_replace_one underscore
  set fish_cursor_replace underscore
  set fish_cursor_external block
end
