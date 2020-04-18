" ====================================================================
" Make sure to:
" 1. source this file somewhere at the bottom of your config.
" 2. disable any statusline plugins, as they will override this.
" ====================================================================

" Do not show mode under the statusline since the statusline itself changes
" color depending on mode
set noshowmode

set laststatus=2
" ~~~~ Statusline configuration ~~~~
" ':help statusline' is your friend!
function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineFilename ctermfg=4 cterm=none ctermbg=NONE
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineFilename ctermfg=1 cterm=none ctermbg=NONE
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineFilename ctermfg=3 cterm=none ctermbg=NONE
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineFilename ctermfg=5 cterm=none ctermbg=NONE
  " Command mode
  elseif a:mode == 'c'
    hi MyStatuslineFilename ctermfg=6 cterm=none ctermbg=NONE
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineFilename ctermfg=1 cterm=none ctermbg=NONE
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction
" }}}
function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody ctermbg=NONE cterm=bold ctermfg=1
    else
        hi MyStatuslineModifiedBody ctermbg=NONE cterm=bold ctermfg=8
    endif
    return ''
endfunction
" }}}
function! SetFiletype(filetype) " {{{
  if a:filetype == ''
      return '-'
  else
      return a:filetype
  endif
endfunction
" }}}

" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RedrawModeColors(mode())}
" Left side items
" =======================
" Filename
set statusline+=%#MyStatuslineFilename#\ %.40f
" padding
set statusline+=\ 
" Modified status
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
" Right side items
" =======================
set statusline+=%=
" Padding
set statusline+=\ 
" Current scroll percentage and total lines of the file
set statusline+=%#MyStatuslinePercentageBody#%P
set statusline+=\/\%#MyStatuslinePercentageBody#%L
" Padding
set statusline+=\ 
" Filetype
set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
" padding
set statusline+=\ 
" Setup the colors
hi StatusLine          ctermfg=5     ctermbg=NONE     cterm=NONE
hi StatusLineNC        ctermfg=8     ctermbg=NONE     cterm=bold

hi MyStatuslineSeparator ctermfg=0 cterm=NONE ctermbg=NONE

hi MyStatuslineModified ctermfg=0 cterm=NONE ctermbg=NONE

hi MyStatuslineFiletype ctermbg=NONE cterm=NONE ctermfg=0
hi MyStatuslineFiletypeBody ctermfg=5 cterm=italic ctermbg=NONE

hi MyStatuslinePercentage ctermfg=0 cterm=NONE ctermbg=NONE
hi MyStatuslinePercentageBody ctermbg=NONE cterm=none ctermfg=6
