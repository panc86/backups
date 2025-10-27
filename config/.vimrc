" leader is SPACE
let mapleader=" "

" highlight syntax
syntax on

" show line number
set number
set relativenumber

" consisten cursor style N/I modes
set guicursor=""

" force splits below and right
set splitbelow
set splitright

" indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showtabline=2
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set smarttab

" history backup
set noswapfile
set nobackup
set undofile

" fast updates
set updatetime=50
-
" show column margin
set colorcolumn=100
" define column margin color
highlight ColorColumn ctermbg=238


" Remaps

" go to project view
nnoremap <leader>. :Ex<CR>
" update current buffer
nnoremap <leader>w :w!<CR>
" move selected block down
vnoremap J :m >+1<CR>gv=gv
" move selected block down
vnoremap K :m <-2<CR>gv=gv
