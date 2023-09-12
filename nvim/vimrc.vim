let mapleader = " " " map leader to Space

" Install plugins
call plug#begin(stdpath('data') . '/plugged')  
  Plug 'neovim/nvim-lspconfig'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'preservim/nerdtree'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
  Plug 'sbdchd/neoformat'
  Plug 'numToStr/Comment.nvim'
call plug#end()

" Visual flair
colorscheme github_dark " GitHub dark
set number " Show line numbers
set nowrap "Don't wrap lines
set hlsearch " Highlight search matches
set cursorline "Emphasize the currently active line

" Enable relative line numbers
set number relativenumber

" To go up/down wrapped lines
map j gj
map k gk

" Use system clipboard
if has("unnamedplus")
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Hate swap files
set noswapfile

" Keep the error column always visible (jumpy when linter runs on input)
:set signcolumn=yes

" NerdTree mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Nice window movements
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Make windows equal size
nnoremap <leader>= <C-w>=

" Sizing window horizontally
nnoremap <c-,> <C-W><
nnoremap <c-.> <C-W>>
nnoremap <c-<> <C-W>5<
nnoremap <c->> <C-W>5>

" Too much spacemacs muscle memory
nnoremap <leader>w/ :vs<CR>
nnoremap <leader>w- :split<CR>

" Move easily to the next error
nnoremap <leader>l :lnext<CR>
nnoremap <leader>h :lprevious<CR>

" Move line(s) up and down
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

set showmatch
set incsearch
set ignorecase 
set smartcase

" Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set splitright "prefer splitting to the right

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files({cwd=require('telescope.utils').buffer_dir()})<cr>

nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
nnoremap <leader>fgb <cmd>Telescope git_branches<cr>
nnoremap <C-s> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader><tab> :b# <CR>




" Neoformat config
let g:neoformat_try_node_exe = 1
nnoremap <leader>jf <cmd>Neoformat<cr>



