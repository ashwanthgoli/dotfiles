set nocompatible
set ttyfast
set backspace=indent,eol,start
set noignorecase
set laststatus=2
set backspace=2
set cursorline

set clipboard^=unnamed

set number
set nowrap
set hlsearch
set timeoutlen=500
"set omnifunc

set tabstop=8 "set the no. of columns that tab expands to in insert mode
set expandtab "donot expand to spaces"
set shiftwidth=8 "tabstop for >> << normal mode
syntax on
filetype on
filetype indent on
filetype plugin on

set autoindent
set pastetoggle=<f5>
"set cursorline
set mouse=r
set wildmenu
set wildmode=list:longest,full
set cc=81
"set scrolloff=5
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let ayucolor="mirage"
colorscheme ayu


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"netrw
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4


if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mhinz/vim-signify'
"Plug 'psliwka/vim-smoothie'
Plug 'rust-lang/rust.vim'
"Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-startify'
"
Plug 'folke/which-key.nvim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'editorconfig/editorconfig-vim'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/vim-clap'
Plug 'mfussenegger/nvim-dap'

Plug 'preservim/vimux'
Plug 'sebdah/vim-delve'

" Add plugins to &runtimepath
call plug#end()

" airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 0

let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'z', 'error', 'warning' ]
    \ ]

let g:go_def_mapping_enabled = 0

map <Space> <leader>

"nnoremap <leader>u :GoReferrers<CR>
nnoremap <leader>] :GoImplements<CR>
nnoremap <leader>[ :GoDefPop<CR>
nnoremap <leader>1 :NERDTreeToggle %<CR>

" nav
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fs <cmd>Telescope coc workspace_symbols<cr>
nnoremap <leader>fw <cmd>Clap grep ++query=<cword><cr>

nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>e <cmd>Buffers<cr>
nnoremap <leader>j <cmd>Telescope jumplist<cr>
nnoremap <leader>/ <cmd>Clap grep<cr>
nnoremap <leader>s <cmd>Clap tags<cr>
nnoremap <leader>n <cmd>tab split<cr>


""""" COC """"""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fmt  <Plug>(coc-format-selected)
nmap <leader>fmt  <Plug>(coc-format-selected)

""" Treesitter """
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

""" Vista """
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'

let g:fzf_action = {
  \ 'ctrl-n': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

""" Which-key """
lua <<EOF
  local wk = require("which-key")
  wk.register({}, {})
EOF

lua <<EOF
  local dap = require('dap')
  dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages 
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    } 
  }

  vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})

EOF

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

let g:delve_use_vimux = 1
