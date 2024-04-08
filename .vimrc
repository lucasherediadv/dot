" General
filetype plugin indent on
set viminfofile=NONE
colorscheme habamax
set relativenumber
set nowritebackup
set noswapfile
set linebreak
set nobackup
set wrap

" Indentation
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab

augroup custom_indentation
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4
  autocmd Filetype go setlocal shiftwidth=4 softtabstop=4
augroup END

