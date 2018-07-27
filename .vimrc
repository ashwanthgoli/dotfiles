syntax enable
set t_Co=256
set background=dark
"colorscheme base16-atelierdune
colorscheme gruvbox
"let g:molokai_original = 1

set laststatus=0
set ttyfast
set nocompatible
set backspace=2
"set backspace=indent,eol,start

set number
set relativenumber
set nowrap
set hlsearch

set tabstop=8 "set the no. of columns that tab expands to in insert mode
"set expandtab "donot expand to spaces"
set shiftwidth=8 "tabstop for >> << normal mode
syntax on
set autoindent
set smartindent
set pastetoggle=<f5>
set cursorline
set mouse=r
set wildmenu
set wildmode=list:longest,full
set cc=81
set scrolloff=5
filetype plugin on

"Vim plug
call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'morhetz/gruvbox'
"Plug 'vim-scripts/YankRing.vim'
Plug 'majutsushi/tagbar'
"Plug 'kien/ctrlp.vim'
"Plug 'xolox/vim-easytags'
""Plug 'xolox/vim-misc'
""Plug 'guiniol/vim-showspaces'

Plug 'raimondi/delimitmate'
Plug 'inkarkat/vim-mark'

"Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
"Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'mhinz/vim-signify'

"Plug 'w0rp/ale'
"Plug 'itchyny/lightline.vim'

" Add plugins to &runtimepath
call plug#end()
set tags=./tags;/home/ashwanth/

source ~/.vim/cscope_maps.vim

if has("cscope")
       set csprg=/usr/local/bin/cscope
       set csto=0
       set cst
       set nocsverb
       " add any database in current directory
       if filereadable("cscope.out")
           cs add cscope.out
       " else add database pointed to by environment
       elseif $CSCOPE_DB != ""
           cs add $CSCOPE_DB
       endif
       set csverb
endif

nmap <F8> :TagbarToggle<CR>
nmap <silent> <Leader>b :TagbarToggle<CR>

"let b:showSpaces = 1
"let b:showSpacesConceal = 1

"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '.'

"Ag
"let g:ackprg = 'ag --nogroup --nocolor --column'
