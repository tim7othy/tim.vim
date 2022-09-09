set runtimepath+=$HOME/.vim
set nocompatible

" bell
set noerrorbells
set novisualbell

" editing
set autoread
autocmd FocusGained * checktime
set autowrite
set noundofile
set nobackup
set noswapfile
set nowritebackup
set noignorecase
set modifiable
set shortmess+=c
set backspace=indent,eol,start
set whichwrap+=b,s,<,>,[,]
set clipboard^=unnamed,unnamedplus
set listchars=tab:>·,trail:~,extends:>,precedes:<
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list

" file encoding
" set fileformat=unix
" set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
set termencoding=utf-8
set encoding=utf-8

" mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" plugin
filetype on
filetype plugin on
filetype indent on

" syntax
syntax on
syntax enable

" menu window
set completeopt=menu

" folding
set foldenable
set foldmethod=indent
set foldnestmax=99
set foldlevel=99
nnoremap zz @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" indent
set cindent
set smartindent
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" search
set magic
set hlsearch

" display
set ruler
" set colorcolumn=120
set showmatch
set showcmd
set wrap
set cursorline
set scrolloff=1
set nocursorcolumn
set norelativenumber
set number
set hidden
set termguicolors
set cmdheight=2
set laststatus=2
set updatetime=200
set signcolumn=yes

" render optimization
set lazyredraw
set ttyfast

" fix maxmatchparen memory issue
set mmp=10000

" disable macvim GUI key mappings
let macvim_skip_cmd_opt_movement=1

" disable syntax highlighting sync on big file for better lantency
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syn sync clear | endif

