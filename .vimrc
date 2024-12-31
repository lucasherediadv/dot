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

" use case when searching
" set noignorecase

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

" enough for line numbers + gutter within 80 standard
set textwidth=72

" disable spellcapcheck
set spc=

" more risky but cleaner
set nobackup
set noswapfile
set nowritebackup
set viminfofile=NONE

set icon

" highlight search hits
set hlsearch
set incsearch
set linebreak

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

" Just the formatoptions defaults, these are changed per filetype by
" plugins. Most of the utility of all of this has been superceded by the
" use of modern simplified pandoc for capturing knowledge source instead
" of arbitrary raw text files.

set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

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

" fix bork bash detection
if has("eval")  " vim-tiny detection
fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/bash'
          \ || getline(1) == '#!/bin/bash'
          \ || getline(1) == '#!/usr/bin/env bash'
        set ft=bash
        set shiftwidth=2
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectBash()
endif

" go settings
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
