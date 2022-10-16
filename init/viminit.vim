"======================================================================
"
" viminit.vim - Vim initialize script
"
" Tiny script which makes vim become neat and handy
"
"======================================================================

"----------------------------------------------------------------------
" core initialize
"----------------------------------------------------------------------
set nocompatible

set backspace=eol,start,indent
set autoindent
set cindent
set winaltkeys=no
set nowrap
set wildignore=*.swp,*.bak,*.pyc,*.obj,*.o,*.class
set ttimeout
set ttimeoutlen=50
set cmdheight=1
set ruler
set nopaste
set display=lastline

set shiftwidth=4
set softtabstop=4
set noexpandtab
set tabstop=4

if has('multi_byte')
	set encoding=utf-8
	set fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

set formatoptions+=m
set formatoptions+=B
set showcmd


"----------------------------------------------------------------------
" map CTRL_HJKL to move cursor in all mode
" config terminal bind <backspace> to ASCII code 127
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" buffer keymap
"----------------------------------------------------------------------
" cycle between buffers (n/p)
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>
noremap <silent> <leader>bm :bm<cr>
" split buffer window
noremap <silent> <leader>bv :vs<cr>
noremap <silent> <leader>bs :sp<cr>
" delete current buffer
noremap <silent> <leader>bd :bdelete<cr>
" list all opened buffers
noremap <silent> <leader>bl :ls<cr>
noremap <silent> <leader>bb :ls<cr>:b

"----------------------------------------------------------------------
" window keymaps
"----------------------------------------------------------------------
" split window
noremap <silent> <leader>wv <c-w>v
noremap <silent> <leader>ws <c-w>s
" close window
noremap <silent> <leader>wq <c-w>c
" only current window
noremap <silent> <leader>wo <c-w>o

" cycle between windows
noremap <silent> <leader>ww <c-w>w
" navigate to previous window
noremap <silent> <leader>wp <c-w>p

" HLJK to navigate between windows
noremap <silent> <leader>wh <c-w>h
noremap <silent> <leader>wj <c-w>j
noremap <silent> <leader>wk <c-w>k
noremap <silent> <leader>wl <c-w>l

" navigate to window with number
noremap <silent> <leader>w1 :1wincmd w<cr>
noremap <silent> <leader>w2 :2wincmd w<cr>
noremap <silent> <leader>w3 :3wincmd w<cr>
noremap <silent> <leader>w4 :4wincmd w<cr>
noremap <silent> <leader>w5 :5wincmd w<cr>
noremap <silent> <leader>w6 :6wincmd w<cr>
noremap <silent> <leader>w7 :7wincmd w<cr>
noremap <silent> <leader>w8 :8wincmd w<cr>
noremap <silent> <leader>w9 :9wincmd w<cr>

" window management
" Same as <leader> group mappings
noremap <tab>v <c-w>v
noremap <tab>s <c-w>s

noremap <tab>c <c-w>c

noremap <tab>o <c-w>o

noremap <tab>w <c-w>w
noremap <tab>p <c-w>p

noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l

" manage window size
noremap <tab>+ <c-w>+
noremap <tab>- <c-w>-
noremap <tab>, <c-w>< 
noremap <tab>. <c-w>>
noremap <tab>= <c-w>=

"----------------------------------------------------------------------
" tab keymap
"----------------------------------------------------------------------
noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>

" HL keys to move current tab to left/right
noremap <silent> <leader>th :-tabmove<cr>
noremap <silent> <leader>tl :+tabmove<cr>
" shift+tab
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

noremap <silent> <leader>ta g<tab>

noremap <silent> <leader>t1 :tabn 1<cr>
noremap <silent> <leader>t2 :tabn 2<cr>
noremap <silent> <leader>t3 :tabn 3<cr>
noremap <silent> <leader>t4 :tabn 4<cr>
noremap <silent> <leader>t5 :tabn 5<cr>
noremap <silent> <leader>t6 :tabn 6<cr>
noremap <silent> <leader>t7 :tabn 7<cr>
noremap <silent> <leader>t8 :tabn 8<cr>
noremap <silent> <leader>t9 :tabn 9<cr>
noremap <silent> <leader>t0 :tabn 10<cr>

"----------------------------------------------------------------------
" miscs
"----------------------------------------------------------------------
set scrolloff=2
set showmatch
set matchtime=3
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" insert mode as emacs
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>
inoremap <c-x><c-a> <c-a>
inoremap <c-x><c-b> <c-e>

" faster command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>
cnoremap <c-o> <c-d>
cnoremap <c-x><c-f> <c-f>
cnoremap <c-x><c-a> <c-a>
cnoremap <c-x><c-e> <c-e>
cnoremap <c-x><c-d> <c-d>

" quit all
noremap <silent>Q :<c-u>confirm qall<cr>

