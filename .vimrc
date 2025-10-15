" Designed for vim 8+
if has("eval") " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

set nocompatible

"#################### Vi Compatible (~/.exrc) #######################

" Automatically indent new lines
set autoindent " (alpine)

" set noflash " (alpine-ish only)

" Replace tabs with spaces automatically
set expandtab " (alpine)

" Number of spaces to replace a tab with when expandtab
set tabstop=2 " (alpine)

" Use case when searching
set noignorecase

" Automatically write files when changing when multiple files open
set autowrite

" Deactivate line numbers
set nonumber

" Turn col and row position on in bottom right
set ruler " See ruf for formatting

" Show command and insert mode
set showmode

"###################################################################

" Disable bell (also disable in .inputrc)
set noerrorbells
set visualbell
set vb t_vb=

let mapleader=","

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
  " set foldenable
  " set foldmethod=syntax
  " set foldlevelstart=99  " Open all folds by default
endif

" Mark trailing spaces as errors (break Makefiles, etc.)
match Visual '\s\+$'

" Enough for line numbers + gutter within 80 standard
set textwidth=70
" set colorcolumn=73

" Disable relative line numbers, remove no to sample it
set norelativenumber

" Disable spellcapcheck
set spc=

set spelllang=en,es

" More risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" Highlight search hits
set hlsearch
set incsearch
set linebreak

" Avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" Prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" Not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set noshowmatch

" Wrap around when searching
set wrapscan
set nowrap

" Just the formatoptions defaults, these are changed per filetype by
" plugins. Most of the utility of all of this has been superceded by the
" use of modern simplified pandoc for capturing knowledge source instead
" of arbitrary raw text files.

set fo-=t   " Don't auto-wrap text using text width
set fo+=c   " Autowrap comments using textwidth with leader
set fo-=r   " Don't auto-insert comment leader on enter in insert
set fo-=o   " Don't auto-insert comment leader on o/O in normal
set fo+=q   " Allow formatting of comments with gq
set fo-=w   " Don't use trailing whitespace for paragraphs
set fo-=a   " Disable auto-formatting of paragraph changes
set fo-=n   " Don't recognized numbered lists
set fo+=j   " Delete comment prefix when joining
set fo-=2   " Don't use the indent of second paragraph line
set fo-=v   " Don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " Don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " Long lines not broken in insert mode
set fo+=m   " Multi-byte character line break support
set fo+=M   " Don't add space before or after multi-byte char
set fo-=B   " Don't add space between two multi-byte chars
set fo+=1   " Don't break a line after a one-letter word

" Stop complaints about switching buffer with changes
set hidden

" Command history
set history=100

" Here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" Faster scrolling
set ttyfast

" Allow sensing the filetype
filetype plugin on
filetype indent on

" High contrast for streaming, etc.
" set background=dark

set cinoptions+=:0

" Just one status line instead of two
set laststatus=0 " For none

" Edit/Reload vimrc configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>
nnoremap coming i_In development..._<Esc>

set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" Base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=244 ctermbg=NONE
hi StatusLineNC ctermfg=244 ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=244 ctermbg=NONE
hi SpecialKey ctermfg=244ctermbg=NONE
hi ModeMsg ctermfg=244 cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=244 ctermbg=NONE
hi NonText ctermfg=244 ctermbg=NONE
hi vimGlobal ctermfg=244 ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred
hi SignColumn ctermbg=NONE " Make gutter less annoying
hi WinBar ctermfg=244 ctermbg=NONE cterm=NONE

" Color overrides
au FileType * hi StatusLine ctermfg=244 ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=244 ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=244 ctermbg=NONE
au FileType * hi SpecialKey ctermfg=244 ctermbg=NONE
au FileType * hi ModeMsg ctermfg=244 cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=244ctermbg=NONE
au FileType * hi NonText ctermfg=244 ctermbg=NONE
au FileType * hi vimGlobal ctermfg=244 ctermbg=NONE
au FileType * hi Comment ctermfg=244 ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc set tw=0
au FileType markdown,pandoc set wrap
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType yaml set sw=2
au FileType sh,bash set sw=2
au FileType c set sw=8
au FileType markdown,pandoc,asciidoc noremap j gj
au FileType markdown,pandoc,asciidoc noremap k gk
au FileType sh,bash set noet

" Force loclist to always close when buffer does (affects vim-go, etc.)
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

autocmd BufWritePost *.{md,adoc} silent !toemoji %

" Make Y consistent with D and C (yank til end)
map Y y$

" Better command-line completion
set wildmenu

" Better cursor movement
" set virtualedit=all
set wrap

" Disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" Enable omni-completion
set omnifunc=syntaxcomplete#Complete
imap <tab><tab> <c-x><c-o>

" Force some files to be specific file type
au bufnewfile,bufRead .goreleaser set ft=yaml
au bufnewfile,bufRead *.props set ft=jproperties
au bufnewfile,bufRead *.ddl set ft=sql
au bufnewfile,bufRead *.sh* set ft=sh
au bufnewfile,bufRead *.{peg,pegn} set ft=config
au bufnewfile,bufRead *.gotmpl set ft=go
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead .dockerignore set filetype=gitignore
au bufnewfile,bufRead .bashrc,.bash_profile set filetype=bash
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql
au bufnewfile,bufRead *.go set nospell filetype=go
au bufnewfile,bufRead commands.yaml set spell
au bufnewfile,bufRead *.{txt,md,adoc} set spell

" Fix bork bash detection
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

" Displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
endif

" Start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F12> :set fdm=indent<CR>

set cursorline
highlight CursorLine cterm=NONE ctermbg=236

nmap <leader>2 :set paste<CR>i

" Disable arrow keys (vi muscle memory)
" noremap <up> :echoerr "Umm, use k instead"<CR>
" noremap <down> :echoerr "Umm, use j instead"<CR>
" noremap <left> :echoerr "Umm, use h instead"<CR>
" noremap <right> :echoerr "Umm, use l instead"<CR>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" Set TMUX window name to name of file
if exists('$TMUX')
    autocmd BufEnter * call system('tmux rename-window ' . expand('%:p:h:t') . '/' . expand('%:t'))
endif

" Apply settings specifically for Go files
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" Read personal/private vim configuration (keep last to override)
set rtp^=~/.vimpersonal
set rtp^=~/.vimprivate
set rtp^=~/.vimwork
