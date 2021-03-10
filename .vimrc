syntax enable
"set t_Co=256
"set background=dark
"colorscheme Tomorrow-Night-Eighties
let python_highlight_all=1

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"colorscheme challenger_deep

set laststatus=0
set ttyfast
set nocompatible
set backspace=2

set clipboard^=unnamed

set number
set nowrap
set hlsearch
"set omnifunc

set tabstop=4 "set the no. of columns that tab expands to in insert mode
set expandtab "donot expand to spaces"
set shiftwidth=4 "tabstop for >> << normal mode
syntax on
filetype plugin indent on
set autoindent
set smartindent
set pastetoggle=<f5>
"set cursorline
set mouse=r
set wildmenu
set wildmode=list:longest,full
set cc=81
set scrolloff=5
filetype plugin on

"Vim plug
call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mhinz/vim-signify'
Plug 'psliwka/vim-smoothie'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'

"Plug 'tpope/vim-fugitive'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'

" Add plugins to &runtimepath
call plug#end()

nmap <F8> :TagbarToggle<CR>

"Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>
