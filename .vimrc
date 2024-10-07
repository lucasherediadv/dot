" vim-tiny lacks 'eval'
if has("eval") 
  let skip_defaults_vim=1
  let g:loaded_matchparen=1
  let g:loaded_netrwPlugin=1
endif

" Enable syntax highlighting
if has("syntax")
  syntax on
endif

set nocompatible " Disable compatibility with vi
set showmode " Show command and insert mode
set autoindent " Automatically indent new lines
set expandtab " Replace tabs with spaces
set tabstop=2 " Number of spaces to replace a tab with
set shiftwidth=2 " Indent by 2 spaces
set autowrite " Automatically write files
set smarttab " Always use shiftwidht
set softtabstop=2 " Use value of shiftwidth
set nonumber " Deactivate line numbers
set wrap " Wrap lines
set nofoldenable " No automatic folding
set ruler " Turn col and row position on in the bootom right
set viminfofile=NONE " No write viminfo file
set nowritebackup " No write backup
set noswapfile " No swap file
set nobackup " No backup
