let skip_defaults_vim = 1 " Skip VIM defaults.
set nocompatible " Disable VI compatibility.

colorscheme habamax " Set colorscheme.
filetype plugin indent on " Load plugins according to detected filetype.
syntax on " Enable syntax highlighting.
set nonumber " Deactivate line numbers.
set noincsearch " No incremental search.
set nohlsearch " No highlight search.
set noshowmode " No show mode.
set nowritebackup " No write backup.
set noswapfile " No write swapfile.
set nobackup " No backup
set ignorecase " Use case when search.
set viminfofile=NONE " No write viminfo file.
set tabstop=2 " Number of spaces to replace a tab with when expandtab.
set softtabstop=2 " Tab key indents by 2 spaces.
set shiftwidth=2 " Indents by 2 spaces.
set autoindent " Indent according to previous line.
set expandtab " Use spaces instead of tabs.

" Custom settings per filetype.
augroup custom_settings
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd Filetype go setlocal shiftwidth=4 softtabstop=4 tabstop=4
augroup END

