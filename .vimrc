set backspace=indent,eol,start
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let ayucolor="mirage"
colorscheme ayu

let python_highlight_all=1

set noignorecase
set laststatus=2
set ttyfast
set nocompatible
set backspace=2

set clipboard^=unnamed

set number
set nowrap
set hlsearch
"set omnifunc

set tabstop=4 "set the no. of columns that tab expands to in insert mode
"set expandtab "donot expand to spaces"
"set shiftwidth=4 "tabstop for >> << normal mode
syntax on
filetype on
filetype indent on
filetype plugin on
set autoindent
set smartindent
set pastetoggle=<f5>
set cursorline
set mouse=r
set wildmenu
set wildmode=list:longest,full
set cc=81
"set scrolloff=5

"netrw
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mhinz/vim-signify'
"Plug 'psliwka/vim-smoothie'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'sebdah/vim-delve'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'editorconfig/editorconfig-vim'
" Add plugins to &runtimepath
call plug#end()

"Syntactic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <Leader>E :SyntasticCheck<CR>

let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 0

let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'z', 'error', 'warning' ]
    \ ]

map <Space> <leader>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>e :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>u :GoReferrers<CR>
nnoremap <Leader>] :GoImplements<CR>
nnoremap <Leader>[ :GoDefPop<CR>
nnoremap <Leader>1 :NERDTreeToggle %<CR>
