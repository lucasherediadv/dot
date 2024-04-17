set nocompatible " Disable VI compatibility.
let skip_defaults_vim = 1 " Skip VIM defaults.

colorscheme habamax " Set colorscheme.
filetype plugin indent on " Load plugins according to detected filetype.

set nobackup " No backup
set noswapfile " No write swapfile.
set nowritebackup " No write backup.
set viminfofile=NONE " No write viminfo file.

set ignorecase " Ignore case when search.
set smarttab " Always use shiftwidth.
set shiftwidth=2 " Indent by 2 spaces.
set expandtab " Use spaces instead of tabs.
set softtabstop=-1 " Use value of shiftwidth.

" Clear search highlight.
map <silent> <leader> :noh<cr>

" Custom indentation settings per filetype.
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd Filetype go setlocal shiftwidth=4 softtabstop=4 tabstop=4

