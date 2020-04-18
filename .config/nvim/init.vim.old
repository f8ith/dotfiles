call plug#begin('~/.local/share/nvim/plugged')
                   
Plug 'vim-airline/vim-airline'

Plug 'somini/vim-autoclose'

Plug 'scrooloose/nerdtree'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'OmniSharp/omnisharp-vim'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'

"Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'airblade/vim-gitgutter'

Plug 'alvan/vim-closetag'

Plug '907th/vim-auto-save'

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
set clipboard+=unnamedplus

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
let g:deoplete#enable_at_startup = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ale_linters = {
\ 'python': ['flake8'],
\ 'cs': ['OmniSharp']
\}
let g:airline_theme='nord'

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
let mapleader=""
let g:auto_save = 1 

syntax enable

" Plugin key-mappings.
inoremap <expr><C-g>     deoplete#undo_completion()
inoremap <expr><C-l>     deoplete#complete_common_string()

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  deoplete#close_popup()
inoremap <expr><C-e>  deoplete#cancel_popup()
nnoremap <leader>nm :OmniSharpRename<cr>
inoremap <Leader><Leader> <Esc>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer

set termguicolors
set number relativenumber
set nu rnu
colorscheme nord

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
