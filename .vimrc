let skip_defautls_vim=1
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:loaded_matchparen=1

set nocompatible
filetype plugin indent on " load plugins according to detected filetype.
syntax on " enable syntax highlighting
colorscheme habamax

set number " activate line numbers
set relativenumber " activate line relative numbers

set list
set listchars=tab:→\ ,nbsp:␣,trail:·,extends:⟩,precedes:⟨

set wrap
set linebreak

set expandtab
set autoindent
set smarttab
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set hlsearch
set incsearch
set ignorecase

set nobackup
set noswapfile
set nowritebackup

" clear search highlight with <Esc><Esc>
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

