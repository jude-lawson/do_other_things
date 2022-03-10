call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" statusline
Plug 'itchyny/lightline.vim'

" git
Plug 'tpope/vim-fugitive'

" editing utilities
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" syntax highlighting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typesript' }

" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" rose-pine theme
Plug 'rose-pine/neovim'

" Fuzzy stuff
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

lua <<EOF
print ('hello from lua')
EOF

set termguicolors
"
" ============================== STATUSLINE ==============================
" no duplicate status mode (Ex. '--INSERT--')
set noshowmode

" ============================== MAPPINGS ==============================
" make commanding vim easier
nnoremap ; :
nnoremap <Leader>; ;
vnoremap ; :
vnoremap <Leader>; ;

" easy window navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" easy FZF
nnoremap <Leader>gv :GFiles<CR>

" easy window resize
nnoremap <Up> :res +5<CR>
nnoremap <Down> :res -5<CR>
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>

" apparently TextEdit can sometimes fail unless hidden is set
set hidden

" Some LSP servers cannot handle backup files
set nobackup
set nowritebackup

" make space ofr diagnostics in column
set signcolumn=number
"
" ============================== MISCELLANEOUS ==============================
syntax on
set number                      " enables line numbers
set noswapfile                  " none of those dastardly swap files
set nohlsearch                  " disables highlighting search results
set expandtab                   " use spaces instead of tabs
set tabstop=2 shiftwidth=2      " set <Tab> to two spaces
set smarttab                    " sets tabstop when using <Tab> at the beginning of a line
colorscheme rose-pine
set background=dark

" greeting
echo 'Nice work, NVIM init loaded (>^.^<)'
