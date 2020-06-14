" Global {{{

let mapleader=" "

set foldmethod=marker
set timeoutlen=200 ttimeoutlen=0

nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

set termguicolors 
set noshowmode
set showcmd
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
filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')

"}}}

" Veonim {{{

if exists('veonim')

" color schemes 
" Plug 'arcticicestudio/nord-vim'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'ajh17/Spacegray.vim'

"  auto pairs
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" visuals
Plug 'sheerun/vim-polyglot'

" motions
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'

Plug 'easymotion/vim-easymotion'
" smooth scroll
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
  \'ms-python.python',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workleader functions
nno <silent> <c-p> :Veonim files<cr>
nno <silent> <leader>e :Veonim explorer<cr>
nno <silent> <leader>b :Veonim buffers<cr>
nno <silent> <leader>d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <leader>fw :Veonim grep-word<cr>
vno <silent> <leader>fw :Veonim grep-selection<cr>
nno <silent> <leader>fa :Veonim grep<cr>
nno <silent> <leader>ff :Veonim grep-resume<cr>
nno <silent> <leader>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workleader-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> <leader>n :Veonim next-usage<cr>
nno <silent> <leader>p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> ]g :Veonim next-problem<cr>
nno <silent> [g :Veonim prev-problem<cr>

set guifont=Roboto\ Mono:h16

"}}}

" Global plugins {{{
else

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ordinary neovim
" Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" async live server
Plug 'neomake/neomake'

" color schemes 
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ajh17/spacegray.vim'
Plug 'fxn/vim-monochrome'
Plug 'cocopon/iceberg.vim'

"  auto pairs
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" visuals
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'


" motions
Plug 'justinmk/vim-sneak'
Plug 'tomtom/tcomment_vim'

if isdirectory('/usr/bin/fzf')
  Plug '/usr/bin/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'airblade/vim-gitgutter'

"}}}

" VSCode {{{
if exists('g:vscode')

" VSCode extension
Plug 'asvetliakov/vim-easymotion'
call plug#end()
finish
    
"}}}

" Gonvim {{{

elseif exists('g:gonvim_running')

Plug 'akiyosi/gonvim-fuzzy'  
Plug 'easymotion/vim-easymotion'
" smooth scroll
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

let g:gonvim_fuzzy_ag_cmd = 'rg --no-heading --column --color never'
nnoremap <silent> <leader>f :GonvimFilerOpen<CR>
nnoremap <silent> <C-p> :GonvimFuzzyFiles<CR>
nnoremap <silent> <leader>p :GonvimFuzzyBLines<CR>
nnoremap <silent> <leader>pp :GonvimAg<CR>

"}}}

" Vanilla {{{    
else

" file manager
Plug 'ptzz/lf.vim'
" Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
" Plug 'jeetsukumaran/vim-filebeagle'

Plug 'easymotion/vim-easymotion'
" smooth scroll
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

" coc
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-emmet',
\ 'coc-python',
\ 'coc-omnisharp'
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_leader() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_leader() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fzf
nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <leader><leader>p :RG<CR>

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" -- old config 
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"
" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')
"  
"   let height = float2nr(10)
"   let width = float2nr(80)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1
"  
"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }
"  
"   call nvim_open_win(buf, v:true, opts)
" endfunction
"
autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <leader>rn <Plug>(coc-rename)
xnoremap <leader>f  <Plug>(coc-format-selected)
xnoremap <leader>aa  <Plug>(coc-codeaction-selected)
nnoremap <leader>aa  <Plug>(coc-codeaction-selected)
nnoremap <leader>ac  <Plug>(coc-codeaction)
nnoremap <leader>qf  <Plug>(coc-fix-current)
xnoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap if <Plug>(coc-funcobj-i)
onoremap af <Plug>(coc-funcobj-a)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
nnoremap <silent> <leader>pp  :<C-u>CocListResume<CR>

" neomake 
let g:neomake_liveserver_maker = {
     \ 'exe': 'live-server',
     \ 'args': '--quiet'
     \ }

let g:neomake_html_enabled_makers = ['liveserver']

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

" autocmd
augroup filetypes
    autocmd FileType ruby,json,haml,eruby,yaml,html,javascript,coffee,sass,cucumber,stylus,css,xml,htmldjango set ai ts=2 sw=2 sts=2 et
    autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd vimenter * NERDTree
" noremap <leader>f :NERDTreeToggle<CR>

" defx
" function! s:defx_my_settings() abort
"   " Define mappings
"   nnoremap <silent><buffer><expr> <CR>
"   \ defx#do_action('open')
"   nnoremap <silent><buffer><expr> c
"   \ defx#do_action('copy')
"   nnoremap <silent><buffer><expr> m
"   \ defx#do_action('move')
"   nnoremap <silent><buffer><expr> p
"   \ defx#do_action('paste')
"   nnoremap <silent><buffer><expr> l
"   \ defx#do_action('open')
"   nnoremap <silent><buffer><expr> E
"   \ defx#do_action('open', 'vsplit')
"   nnoremap <silent><buffer><expr> P
"   \ defx#do_action('open', 'pedit')
"   nnoremap <silent><buffer><expr> o
"   \ defx#do_action('open_or_close_tree')
"   nnoremap <silent><buffer><expr> K
"   \ defx#do_action('new_directory')
"   nnoremap <silent><buffer><expr> N
"   \ defx#do_action('new_file')
"   nnoremap <silent><buffer><expr> M
"   \ defx#do_action('new_multiple_files')
"   nnoremap <silent><buffer><expr> C
"   \ defx#do_action('toggle_columns',
"   \                'mark:indent:icon:filename:type:size:time')
"   nnoremap <silent><buffer><expr> S
"   \ defx#do_action('toggle_sort', 'time')
"   nnoremap <silent><buffer><expr> d
"   \ defx#do_action('remove')
"   nnoremap <silent><buffer><expr> r
"   \ defx#do_action('rename')
"   nnoremap <silent><buffer><expr> !
"   \ defx#do_action('execute_command')
"   nnoremap <silent><buffer><expr> x
"   \ defx#do_action('execute_system')
"   nnoremap <silent><buffer><expr> yy
"   \ defx#do_action('yank_path')
"   nnoremap <silent><buffer><expr> .
"   \ defx#do_action('toggle_ignored_files')
"   nnoremap <silent><buffer><expr> ;
"   \ defx#do_action('repeat')
"   nnoremap <silent><buffer><expr> h
"   \ defx#do_action('cd', ['..'])
"   nnoremap <silent><buffer><expr> ~
"   \ defx#do_action('cd')
"   nnoremap <silent><buffer><expr> q
"   \ defx#do_action('quit')
"   nnoremap <silent><buffer><expr> <Space>
"   \ defx#do_action('toggle_select') . 'j'
"   nnoremap <silent><buffer><expr> *
"   \ defx#do_action('toggle_select_all')
"   nnoremap <silent><buffer><expr> j
"   \ line('.') == line('$') ? 'gg' : 'j'
"   nnoremap <silent><buffer><expr> k
"   \ line('.') == 1 ? 'G' : 'k'
"   nnoremap <silent><buffer><expr> <C-l>
"   \ defx#do_action('redraw')
"   nnoremap <silent><buffer><expr> <C-g>
"   \ defx#do_action('print')
" endfunction

" function! s:open_defx_if_directory()
"   let l:full_path = expand(expand('%:p'))
"   if isdirectory(l:full_path)
"     Defx `expand('%:p')`
"   endif
" endfunction
" 
" augroup defx_config
"   autocmd!
"   autocmd FileType defx call s:defx_my_settings()
"   autocmd BufEnter * call s:open_defx_if_directory()
" augroup END

" nnoremap <silent> <leader>f :Defx -auto-cd<CR>
" ale
"let g:ale_linters = {
"\ 'python': ['flake8']
"\}
"let g:ale_list_window_size = 5
"let g:ale_python_pyls_auto_pipenv = 0

" lf
let g:lf_replace_netrw = 1
map <leader>ff :LfNewTab<CR>

" ranger
" let g:ranger_replace_netrw = 1
" map <leader>ff :RangerNewTab<CR>

" Netrw
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 20
"
" function! OpenToRight()
"   :normal v
"   let g:path=expand('%:p')
"   :q!
"   execute 'belowright vnew' g:path
"   :normal <C-w>l
" endfunction
"
" function! OpenBelow()
"   :normal v
"   let g:path=expand('%:p')
"   :q!
"   execute 'belowright new' g:path
"   :normal <C-w>l
" endfunction
"
"
" function! NetrwMappings()
"     " Hack fix to make ctrl-l work properly
"     noremap <buffer> <A-l> <C-w>l
"     noremap <buffer> <C-l> <C-w>l
"     noremap <silent> <A-f> :call ToggleNetrw()<CR>
"     noremap <buffer> V :call OpenToRight()<cr>
"     noremap <buffer> H :call OpenBelow()<cr>
" endfunction
"
" augroup netrw_mappings
"     autocmd!
"     autocmd filetype netrw call NetrwMappings()
" augroup END
"
" " Allow for netrw to be toggled
" function! ToggleNetrw()
"     if g:NetrwIsOpen
"         let i = bufnr("$")
"         while (i >= 1)
"             if (getbufvar(i, "&filetype") == "netrw")
"                 silent exe "bwipeout " . i
"             endif
"             let i-=1
"         endwhile
"         let g:NetrwIsOpen=0
"     else
"         let g:NetrwIsOpen=1
"         silent Lexplore
"     endif
" endfunction
"
" " Check before opening buffer on any file
" function! NetrwOnBufferOpen()
"   if exists('b:noNetrw')
"       return
"   endif
"   call ToggleNetrw()
" endfun
"
" " Close Netrw if it's the only buffer open
" autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
"
" " Make netrw act like a project Draw
" augroup ProjectDrawer
"   autocmd!
"       	" Don't open Netrw
"   autocmd VimEnter ~/.config/joplin/tmp/*,/tmp/calcurse*,~/.calcurse/notes/*,~/vimwiki/*,*/.git/COMMIT_EDITMSG let b:noNetrw=1
"   autocmd VimEnter * :call NetrwOnBufferOpen()
" augroup END
"
" let g:NetrwIsOpen=0

" spacegray.vim
let g:spacegray_low_contrast = 1
let g:spacegray_use_italics = 1

colorscheme nord
    
endif

endif

"}}} 
" Global plugin config {{{

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

" highlight hi DiffAdd ctermbg=0
hi DiffChange ctermbg=0
hi DiffDelete ctermbg=0

"}}}
