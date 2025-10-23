" vim-tiny lacks 'eval'
if has("eval")
  let skip_defaults_vim = 1
endif

" Disable vi compatibility mode
set nocompatible

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

" Turn col and row position on in bottom right
set ruler
set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

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

" Enough for line numbers + gutter within 80 standard
set textwidth=70

" Disable relative line numbers
set norelativenumber

" Disable spellcapcheck
set spc=

set spelllang=en,es

" More risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

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

" Wrap around when searching and set wrap
set wrapscan
set wrap

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

" Faster scrolling in terminal
set ttyfast

" Allow sensing the filetype
filetype plugin on
filetype indent on

set cinoptions+=:0

" No status line
set laststatus=0

if has("terminal") || exists("$COLORTERM")
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
endif

" Make Y consistent with D and C (yank til end)
map Y y$

" Better command-line completion
set wildmenu

" Disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" Force some files to be specific file type
au bufnewfile,bufRead .goreleaser setl ft=yaml
au bufnewfile,bufRead *.props setl ft=jproperties
au bufnewfile,bufRead *.ddl setl ft=sql
au bufnewfile,bufRead *.sh* setl ft=sh
au bufnewfile,bufRead *.{peg,pegn} setl ft=config
au bufnewfile,bufRead *.gotmpl setl ft=go
au bufnewfile,bufRead *.profile setl filetype=sh
au bufnewfile,bufRead *.crontab setl filetype=crontab
au bufnewfile,bufRead *ssh/config setl filetype=sshconfig
au bufnewfile,bufRead .dockerignore setl filetype=gitignore
au bufnewfile,bufRead .bashrc,.bash_profile setl filetype=bash
au bufnewfile,bufRead *gitconfig setl filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* setl syntax=sql
au bufnewfile,bufRead *.go setl nospell filetype=go
au bufnewfile,bufRead commands.yaml setl spell
au bufnewfile,bufRead *.{txt,md,adoc} setl spell

" Start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set cursorline
highlight CursorLine cterm=NONE ctermbg=236

" Apply settings specifically for Go files
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
