" vim-tiny lacks 'eval'
if has("eval")
  let skip_defaults_vim=1
endif

set nocompatible

" automatically indent new lines
set autoindent

" replace tabs with spaces
set expandtab

" number of spaces to replace a tab with when expandtab
set tabstop=2

" don't use case when searching
set ignorecase

" automatically write files when changing when multiple files open
set autowrite

" deactivate line numbers
set nonumber
set norelativenumber

" turn col and row position on in bootom right
set ruler

" show command and insert mode
set showmode

" disable bell
set noerrorbells
set visualbell
set vb t_vb=

set softtabstop=2

" mostly used with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
  " set list

  " no automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" disable spellcapcheck
set spc=

" more risky but cleaner
set nobackup
set noswapfile
set nowritebackup
set viminfofile=NONE

set icon

" highlight search hits
" set hlsearch
" set incsearch
set linebreak
set nohlsearch

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" not a fan of bracket matching
if has("eval")
  let g:loaded_matchparen=1
endif
set noshowmatch

" disable netrw plugin
if has("eval")
  let g:loaded_netrwPlugin=1
endif

" wrap around when searching
set wrapscan

" stop complaints about switching buffer with changes
set hidden

" command history
set history=0

if has("syntax")
  syntax on
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" no status line
set laststatus=0

" better command-line completion
set wildmenu

" better cursor movement
set wrap

" go settings
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
