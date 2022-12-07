let mapleader = "'"
inoremap jk <ESC>
syntax on
set number
set noswapfile
set hlsearch 
set ignorecase
set noexpandtab 
set incsearch
nnoremap qw ^elxi
nmap Y y$
nmap )) ysiw)
nmap '""' ysiw"
nmap vv v$

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
