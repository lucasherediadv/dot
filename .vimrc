" Skip default settings only if 'eval' is available
if has("eval")
  let skip_defaults_vim = 1
endif

" Disable vi compatibility mode
set nocompatible

" Enable file type detection, plugin loading, and indentation
filetype plugin indent on

" Automatically indent new lines
set autoindent

" Replace tabs with spaces automatically
set expandtab

" Number of spaces to replace a tab with when expandtab
set tabstop=2

" Use case when searching
set ignorecase

" Ignore case unless an uppercase letter is used in the search
set smartcase

" Automatically write files when changing when multiple files open
set autowrite

" Deactivate line numbers
set nonumber

" Disable relative line numbers
set norelativenumber

" Turn col and row position on in bottom right
set ruler

" Show command and insert mode
set showmode

" Disable bell/beep (also disable in .inputrc)
set noerrorbells
set visualbell
set vb t_vb=

set softtabstop=2

" Mostly used with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
  " Stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " Better ASCII friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
  set listchars+=eol:↩

  " I hate automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" Mark trailing spaces as errors
match Visual '\s\+$'

" Disable spellcapcheck
set spc=

" More risky, but cleaner
set nobackup
set history=0
set noswapfile
set nowritebackup
set viminfofile=NONE

" Avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" Not a fan of bracket matching or folding (or netrw)
if has("eval")
  let g:loaded_matchparen=1
  let g:loaded_netrw = 0
  let g:loaded_netrwPlugin = 0
endif
set noshowmatch

" Wrap around when searching and set wrap
set wrapscan
set wrap

" Stop complaints about switching buffer with changes
set hidden

" Here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" Faster scrolling in terminal
set ttyfast

" No status line
set laststatus=0

" Make Y consistent with D and C (yank til end)
map Y y$

" Better command-line completion
set wildmenu

" Apply settings specifically for Go files
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
