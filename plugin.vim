source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')

" Color Theme
Plug 'lifepillar/vim-solarized8'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'KeitaNakamura/neodark.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'Rigellute/rigel'
Plug 'chriskempson/base16-vim'
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'kaicataldo/material.vim', {'branch': 'main'}
if has('nvim-0.5')
    Plug 'EdenEast/nightfox.nvim'
    Plug 'folke/tokyonight.nvim', {'branch': 'main'}
    Plug 'projekt0n/github-nvim-theme'
endif
if has('nvim-0.6')
    Plug 'rebelot/kanagawa.nvim'
endif

" Search Engine
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Language Server 
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" Programming Language Support
" Haskell
Plug 'neovimhaskell/haskell-vim'


call plug#end()

