let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 IncScript exec 'so '. fnameescape(s:home."/<args>")
exec 'set rtp+='. fnameescape(s:home)
exec 'set rtp+=~/.vim'

let mapleader=','
let g:mapleader=','

IncScript init/viminit.vim
IncScript init/ignores.vim
IncScript init/tools.vim
IncScript init/keymaps.vim
IncScript init/plugins.vim
IncScript init/status.vim
IncScript init/unix.vim

" User Settings
IncScript custom.vim

" VIM Plugins
" source $HOME/.vim/plugin.vim

" basic
" source $HOME/.vim/settings/basic/basic.vim

" ui
" source $HOME/.vim/settings/ui/colorscheme.vim
" source $HOME/.vim/settings/ui/vim-buffet.vim
" source $HOME/.vim/settings/ui/fern.vim.vim

" language
" source $HOME/.vim/settings/language/coc.nvim.vim

" search
" source $HOME/.vim/settings/search/fzf.vim.vim

" User Settings
" source $HOME/.vim/custom.vim

