call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" colorscheme
Plug 'joshdick/onedark.vim'

" editing utilities
Plug 'tpope/vim-surround'

" coc completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax highlighting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typesript' }

" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

set termguicolors

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

" ============================== CoC Configuration ==============================
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" if in a project using prettier, tell CoC to use it
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" if in a project using eslint, tell CoC to use it
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" apparently TextEdit can sometimes fail unless hidden is set
set hidden

" Some LSP servers cannot handle backup files
set nobackup
set nowritebackup

" make space ofr diagnostics in column
set signcolumn=number

" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-imnplementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <Leader>gdl :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <silent> <Leader>gdj :call CocAction('jumpDefinition', 'split')<CR>
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>

" use TAB to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" make <CR> auto-select first completion item / format on select
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
echo 'Nice work, NVIM init loaded (>^.^<)'
