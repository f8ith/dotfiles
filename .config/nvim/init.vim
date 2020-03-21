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
    " Plug 'itchyny/lightline.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " async live server
    Plug 'neomake/neomake'
    
    " color schemes
    Plug 'arcticicestudio/nord-vim'
    Plug 'NLKNguyen/papercolor-theme'
    
    " git integration
    Plug 'tpope/vim-fugitive' 
    
    "  auto pairs
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'

    " visuals
    Plug 'sheerun/vim-polyglot'
    Plug 'ryanoasis/vim-devicons'
    Plug 'shougo/vimfiler'


    Plug 'easymotion/vim-easymotion'
    
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
    
    set noshowmode
    set shiftwidth=4
    set expandtab
    set completeopt-=preview
    set clipboard+=unnamedplus
    
    syntax enable
    
    set number relativenumber
    set nu rnu
    set hidden
    set cmdheight=2
    set updatetime=100
    set shortmess+=c
    set signcolumn=yes
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
    
    filetype plugin on
    
    colorscheme faith

    " lightline
    let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
      \   ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent', 'wordcount' ],
      \     [ 'blame' ]
      \   ],
      \ },
      \ 'component_function': {
      \   'wordcount': 'WordCount',
      \   'blame': 'LightlineGitBlame',
      \ }
    \ }
    let g:lightline.seperator = { 'left': '', 'right': ''}
    let g:lightline.subseparator = { 'left': '|', 'right': '' }
    
    function! LightlineGitBlame() abort
      let blame = get(b:, 'coc_git_blame', '')
      " return blame
      return winwidth(0) > 120 ? blame : ''
    endfunction

    function! WordCount()
        let currentmode = mode()
        if !exists("g:lastmode_wc")
            let g:lastmode_wc = currentmode
        endif
        if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
            let g:lastmode_wc = currentmode
            let l:old_position = getpos('.')
            let l:old_status = v:statusmsg
            execute "silent normal g\<c-g>"
            if v:statusmsg == "--No lines in buffer--"
                let b:wordcount = 0
            else
                let s:split_wc = split(v:statusmsg)
                if index(s:split_wc, "Selected") < 0
                    let b:wordcount = str2nr(s:split_wc[11])
                else
                    let b:wordcount = str2nr(s:split_wc[5])
                endif
                let v:statusmsg = l:old_status
            endif
            call setpos('.', l:old_position)
            return b:wordcount . " words"
        else
            return b:wordcount . " words"
        endif
    endfunction
    " AUTOCMD "
    autocmd FileType ruby,json,haml,eruby,yaml,html,javascript,coffee,sass,cucumber,stylus,css,xml,htmldjango set ai ts=2 sw=2 sts=2 et
    autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et
    autocmd FileType json syntax match Comment +\/\/.\+$+
    
    " ALE "
    "let g:ale_linters = {
    "\ 'python': ['flake8']
    "\}
    "let g:ale_list_window_size = 5
    "let g:ale_python_pyls_auto_pipenv = 0
    
    " closetag 
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
    
    " neomake 
    let g:neomake_liveserver_maker = {
         \ 'exe': 'live-server',
         \ 'args': '--quiet'
         \ }
    let g:neomake_html_enabled_makers = ['liveserver']
    
    " coc
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
     
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction
    
    autocmd CursorHold * silent call CocActionAsync('highlight')
    nmap <leader>rn <Plug>(coc-rename)
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>ac  <Plug>(coc-codeaction)
    nmap <leader>qf  <Plug>(coc-fix-current)
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
    
    command! -nargs=0 Format :call CocAction('format')
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " fzf
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

    let mapleader=" "

    " highlight
    hi DiffAdd ctermbg=0
    hi DiffChange ctermbg=0
    hi DiffDelete ctermbg=0

    source ~/.config/nvim/statusline/faith.vim
    
endif
    
  
