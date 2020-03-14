if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

if exists('g:vscode')
    " VSCode extension
    Plug 'asvetliakov/vim-easymotion'
    call plug#end()
else
    " ordinary neovim
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'   
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neomake/neomake'
    
    Plug 'arcticicestudio/nord-vim'
    Plug 'NLKNguyen/papercolor-theme'
    
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-vinegar'
    Plug 'airblade/vim-gitgutter'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ptzz/lf.vim'
    Plug 'sheerun/vim-polyglot'
    
    if isdirectory('/usr/local/opt/fzf')
      Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    else
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
      Plug 'junegunn/fzf.vim'
    endif
    
    call plug#end()
    
    set timeoutlen=200 ttimeoutlen=0
    
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>
    
    set shiftwidth=4
    set expandtab
    set completeopt-=preview
    set clipboard+=unnamedplus
    
    syntax enable
    
    set termguicolors
    set number relativenumber
    set nu rnu
    set hidden
    set cmdheight=2
    set updatetime=100
    set shortmess+=c
    set signcolumn=yes
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
    
    filetype plugin on
    
    colorscheme nord 
    let g:airline_theme='nord'

    "----- AUTOCMD -----"
    autocmd FileType ruby,json,haml,eruby,yaml,html,javascript,coffee,sass,cucumber,stylus,css,xml,htmldjango set ai ts=2 sw=2 sts=2 et
    autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et
    autocmd FileType json syntax match Comment +\/\/.\+$+
    
    "----- ALE CONFIG -----"
    "let g:ale_linters = {
    "\ 'python': ['flake8']
    "\}
    "let g:ale_list_window_size = 5
    "let g:ale_python_pyls_auto_pipenv = 0
    "let g:airline#extensions#ale#enabled = 1
    
    "----- CLOSETAG CONFIG -----"
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
    
    
    "----- DEOPLETE CONFIG -----"
    "let g:deoplete#enable_at_startup = 1
    "inoremap <expr><C-g>     deoplete#undo_completion()
    "inoremap <expr><C-l>     deoplete#complete_common_string()
    
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    "inoremap <expr><C-h>  deoplete#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  deoplete#close_popup()
    "inoremap <expr><C-e>  deoplete#cancel_popup()
    
    "----- NEOMAKE CONFIG -----"
    "call neomake#configure#automake('nrwi', 100)
    "let g:neomake_python_enabled_makers = ['flake8']
    "let g:neomake_open_list = 0
    "let g:neomake_warning_sign = {
    "      \ 'text': '',
    "      \ 'texthl': 'WarningMsg',
    "      \ }
    
    "let g:neomake_error_sign = {
    "      \ 'text': '',
    "      \ 'texthl': 'ErrorMsg',
    "      \ }
    "autocmd! BufWritePost,BufEnter * Neomake
    "
    let g:neomake_liveserver_maker = {
         \ 'exe': 'live-server',
         \ 'args': '--quiet'
         \ }
    let g:neomake_html_enabled_makers = ['liveserver']
    
    "----- COC CONFIG -----"
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    "----- FZF CONFIG -----"
    nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
    
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
    let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
    let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    
    function! FloatingFZF()
      let buf = nvim_create_buf(v:false, v:true)
      call setbufvar(buf, '&signcolumn', 'no')
     
      let height = float2nr(10)
      let width = float2nr(80)
      let horizontal = float2nr((&columns - width) / 2)
      let vertical = 1
     
      let opts = {
            \ 'relative': 'editor',
            \ 'row': vertical,
            \ 'col': horizontal,
            \ 'width': width,
            \ 'height': height,
            \ 'style': 'minimal'
            \ }
     
      call nvim_open_win(buf, v:true, opts)
    endfunction
    
    "----- LF CONFIG -----"
    " Use lf to select and open file(s) in vim (adapted from ranger).
    function! LF()
        let temp = tempname()
        exec 'silent !lf -selection-path=' . shellescape(temp)
        if !filereadable(temp)
            redraw!
            return
        endif
        let names = readfile(temp)
        if empty(names)
            redraw!
            return
        endif
        exec 'edit ' . fnameescape(names[0])
        for name in names[1:]
            exec 'argadd ' . fnameescape(name)
        endfor
        redraw!
    endfunction
    command! -bar LF call LF()
    nnoremap <leader>l :LF<cr>

endif
    
let mapleader=" "
