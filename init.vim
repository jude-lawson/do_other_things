call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" colorscheme
Plug 'joshdick/onedark.vim'

" editing utilities
Plug 'tpope/vim-surround'
call plug#end()

set termguicolors

" ============================== MISCELLANEOUS ==============================
syntax on
set number                      " enables line numbers
set noswapfile                  " none of those dastardly swap files
set nohlsearch                  " disables highlighting search results
set expandtab                   " use spaces instead of tabs
set tabstop=2 shiftwidth=2      " set <Tab> to two spaces
set smarttab                    " sets tabstop when using <Tab> at the beginning of a line
colorscheme onedark

" greeting
echo 'Hello! (>^.^<)'
