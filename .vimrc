let skip_defaults_vim = 1 " Skip VIM defaults
set nocompatible " Disable VI compatibility

" --------------- Vi Compatible (~/.exrc) ---------------

set autoindent " Automatically indent new lines
set expandtab " Replace tabs with spaces automatically
set tabstop=2 " Number of spaces to replace a tab with when expandtab
set autowrite " Automatically write files when changing when multiple file open

" -------------------------------------------------------

colorscheme habamax " Set colorscheme
filetype plugin indent on " Load plugins according to detected filetype

set nobackup " No backup
set noswapfile " No write swapfile
set nowritebackup " No write backup
set viminfofile=NONE " No write viminfo file

set smarttab " Always use shiftwidth
set shiftwidth=2 " Indent by 2 spaces. Mostly used with >> and <<
set softtabstop=-1 " Use value of shiftwidth

" Custom indentation settings per filetype
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd Filetype go setlocal noexpandtab autoindent tabstop=4 shiftwidth=4
