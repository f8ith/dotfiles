call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-repeat'

Plug 'omnisharp/omnisharp-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'

Plug 'morhetz/gruvbox'

Plug 'airblade/vim-gitgutter'

call plug#end()

set timeoutlen=1000 ttimeoutlen=0

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set completeopt-=preview

let g:OmniSharp_server_stdio = 1
let g:deoplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'python': ['flake8']
\}
let g:OmniSharp_timeout = 5
let mapleader="\<;>"

filetype plugin indent on
syntax enable

au FileType cs setlocal omnifunc=OmniSharp#Complete  

" Plugin key-mappings.
inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()

" Recommended key-mappings.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return deoplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  deoplete#close_popup()
inoremap <expr><C-e>  deoplete#cancel_popup()
nnoremap <leader>nm :OmniSharpRename<cr>

" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer

set termguicolors
set number
colorscheme gruvbox
