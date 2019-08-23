call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-repeat'

Plug 'omnisharp/omnisharp-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-jedi'

Plug 'vim-syntastic/syntastic'

Plug 'tpope/vim-fugitive'

call plug#end()

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:OmniSharp_server_stdio = 1

let g:deoplete#enable_at_startup = 1
let g:syntastic_cs_checkers = ['code_checker']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set timeoutlen=1000 ttimeoutlen=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
