if has("eval") " VIM tiny detection.
  let skip_defaults_vim = 1 " Skip VIM defaults.
  let g:loaded_matchparen=1 " Disable matchparen.
  let g:loaded_netrw=1 " Disable netrw.
endif

" Disable VI compatibility.
if &compatible
  set nocompatible
endif

" Set colorscheme.
colorscheme habamax

filetype plugin indent on " Load plugins according to detected filetype.
syntax on " Enable syntax highlighting.

set nonumber " Deactivate line numbers.
set noincsearch " No incremental search.
set nohlsearch " No highlight search.
set nowrap " No wrap lines.
set noignorecase " Use case when search.

set ruler " Turn col and row position on.
set autowrite " Automatically write files.
set showmode " Show mode.
set list " Display unprinteable characters.
set listchars=trail:*,nbsp:*,extends:>,precedes:<,tab:\|> " ASCII friendly listchars.
set wrap " Wrap lines.
set linebreak " Do not break line at the last character.

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
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd Filetype go setlocal shiftwidth=4 softtabstop=4 tabstop=4
augroup END

