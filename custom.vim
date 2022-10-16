hi! CursorLineNr cterm=none

let g:terminal_skip_key_init = 1
let g:altmeta_num_shift = get(g:, 'vim_num_shif')

"----------------------------------------------------------------------
" personal settings
"----------------------------------------------------------------------

" use `jk` to enter normal mode
inoremap jk <Esc>`^


"----------------------------------------------------------------------
" color scheme
"----------------------------------------------------------------------
set t_Co=256
color desert256

let s:colors = ['biogoo', 'calmbreeze', 'dawn', 'dejavu', 'eclipse2', 'paradox', 'gaea', 'github', 'greyhouse', 'habiLight', 'imperial']
let s:colors += ['mayansmoke', 'mickeysoft', 'newspaper', 'nuvola', 'oceanlight', 'peaksea', 'pyte', 'summerfruit256', 'tomorrow']
let s:colors += ['monokai-vim']

function! SwitchColor()
    call asclib#color_switch(s:colors)
endfunc

hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi SignColumn ctermbg=0


"----------------------------------------------------------------------
" packages
"----------------------------------------------------------------------
if !exists('g:bundle_group')
    let g:bundle_group = []
endif

if get(g:, 'vim_manual', 0) == 0
   let g:bundle_group += ['simple']
   let g:bundle_group += ['nerdtree']
endif

if len(g:bundle_group) > 0
    IncScript bundle.vim
endif


