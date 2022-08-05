" Vim Plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ulwlu/elly.vim'
Plug 'preservim/nerdtree'
Plug 'pantharshit00/vim-prisma'
Plug 'cocopon/iceberg.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile', 'branch': 'feat/support-v3-and-use-server-pkg'}
Plug 'scalameta/nvim-metals'
Plug 'mattn/emmet-vim'

call plug#end()

let g:elly_termmode="cterm"
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
lang en_US.UTF-8



set number
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set clipboard+=unnamedplus
set modifiable

" syntax colors 
syntax enable 
"set termguicolors
colorscheme iceberg

" Split window
" 下
nmap ss :split<Return><C-w>w
" 横
nmap sv :vsplit<Return><C-w>w

" Move window
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
