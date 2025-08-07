" designed for vim 8+

if has("eval") " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

set nocompatible

"#################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent " (alpine)

" set noflash " (alpine-ish only)

" replace tabs with spaces automatically
set expandtab " (alpine)

" number of spaces to replace a tab with when expandtab
set tabstop=2 " (alpine)

" use case when searching
set noignorecase

" automatically write files when changing when multiple files open
set autowrite

" deactivate line numbers
set nonumber

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

"###################################################################

" disable bell (also disable in .inputrc)
set noerrorbells
set visualbell
set vb t_vb=

let mapleader=","

set softtabstop=2

" mostly used with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
  set listchars+=eol:↩

  " i hate automatic folding
  set foldmethod=manual
  set nofoldenable
  " set foldenable
  " set foldmethod=syntax
  " set foldlevelstart=99  " Open all folds by default
endif

" mark trailing spaces as errors (break Makefiles, etc.)
match Visual '\s\+$'

" enough for line numbers + gutter within 80 standard
set textwidth=72
" set colorcolumn=73

" disable relative line numbers, remove no to sample it
set norelativenumber

" disable spellcapcheck
set spc=

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set noshowmatch

" wrap around when searching
set wrapscan
set nowrap

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
set history=100

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" high contrast for streaming, etc.
" set background=dark

set cinoptions+=:0

" just one status line instead of two
set laststatus=0 " for none

" Edit/Reload vimrc configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>
nnoremap coming i_In development..._<Esc>

set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=245 ctermbg=NONE
hi StatusLineNC ctermfg=245 ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=245 ctermbg=NONE
hi SpecialKey ctermfg=245 ctermbg=NONE
hi ModeMsg ctermfg=245 cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=245 ctermbg=NONE
hi NonText ctermfg=245 ctermbg=NONE
hi vimGlobal ctermfg=245 ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred
hi SignColumn ctermbg=NONE " make gutter less annoying
hi WinBar ctermfg=245 ctermbg=NONE cterm=NONE

" color overrides
au FileType * hi StatusLine ctermfg=245 ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=245 ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=245ctermbg=NONE
au FileType * hi SpecialKey ctermfg=245ctermbg=NONE
au FileType * hi ModeMsg ctermfg=245cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=245 ctermbg=NONE
au FileType * hi NonText ctermfg=245 ctermbg=NONE
au FileType * hi vimGlobal ctermfg=245 ctermbg=NONE
au FileType * hi Comment ctermfg=245ctermbg=NONE
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

" force loclist to always close when buffer does (affects vim-go, etc.)
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

autocmd BufWritePost *.{md,adoc} silent !toemoji %

" make Y consistent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" better cursor movement
" set virtualedit=all
set wrap

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete
imap <tab><tab> <c-x><c-o>

" force some files to be specific file type
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
au bufnewfile,bufRead *.go set spell spellcapcheck=0
au bufnewfile,bufRead commands.yaml set spell
au bufnewfile,bufRead *.{txt,md,adoc} set spell

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

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
endif

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" functions keys
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

" disable arrow keys (vi muscle memory)
" noremap <up> :echoerr "Umm, use k instead"<CR>
" noremap <down> :echoerr "Umm, use j instead"<CR>
" noremap <left> :echoerr "Umm, use h instead"<CR>
" noremap <right> :echoerr "Umm, use l instead"<CR>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>

" better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" set TMUX window name to name of file
if exists('$TMUX')
    autocmd BufEnter * call system('tmux rename-window ' . expand('%:p:h:t') . '/' . expand('%:t'))
endif

" read personal/private vim configuration (keep last to override)
set rtp^=~/.vimpersonal
set rtp^=~/.vimprivate
set rtp^=~/.vimwork
