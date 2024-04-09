" Do not use defaults.
let skip_defaults_vim=1
set nocompatible

" Set colorscheme.
colorscheme habamax

filetype plugin indent on " Load plugins according to detected filetype.
syntax on " Enable syntax highlighting.

" Disable matchparen and netrw plugins.
let g:loaded_matchparen=1
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

set noshowmatch " No show match.
set noshowmode " No show mode.
set noincsearch " No incremental search.
set nohlsearch " No highlight search.
set ignorecase " Ignore case in search.
set nowrap " No wrap lines

" Disable files.
set viminfofile=NONE
set nowritebackup
set noswapfile
set nobackup

set tabstop=2 " Number of spaces to replace a tab with when expandtab.
set softtabstop=2 " Tab key indents by 2 spaces.
set shiftwidth=2 " Indents by 2 spaces.
set autoindent " Indent according to previous line.
set expandtab " Use spaces instead of tabs.

" Custom settings per filetype.
augroup custom_settings
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd Filetype go setlocal shiftwidth=4 softtabstop=4 tabstop=4
augroup END

