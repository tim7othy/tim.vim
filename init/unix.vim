" just another setup file yet, some handy stuff


"----------------------------------------------------------------------
" Better setup for VIM 7.0 and later
"----------------------------------------------------------------------
filetype plugin indent on
set hlsearch
set incsearch
set wildmenu
set ignorecase
set cpo-=<
set lazyredraw
set errorformat=%.\ %#-->\ %f:%l:%c,%f(%l):%m,%f:%l:%c:%m,%f:%l:%m
set vop=folds,cursor
set fdm=indent
set foldlevel=99
set tags=./.tags;,.tags
set history=2000
set viminfo+=!

if has('patch-8.1.1300')
	set shortmess-=S
endif

noremap <tab>/ :emenu <C-Z>

" syntax highlighting for delphi/freepascal keywords
let g:pascal_delphi = 1
let g:pascal_fpc = 1


"----------------------------------------------------------------------
" Include Scripts
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

" IncScript / IncRtp
if !exists(':IncScript')
	command! IncScript -nargs=1 exec 'so ' . fnameescape(s:home .'/<args>')
endif

if !exists(':IncRtp')
	command! -nargs=1 IncRtp exec 'set rtp+='.s:home.'/'.'<args>'
endif


"----------------------------------------------------------------------
" turn latest features
"----------------------------------------------------------------------

" Enable vim-diff-enhanced (Christian Brabandt)
if has('patch-8.2.0001')
	set diffopt+=internal,algorithm:patience
	set diffopt+=indent-heuristic
endif

" complete option
if has('patch-8.0.1000')
	set completeopt=menu,menuone,noselect
else
	set completeopt=menu,menuone
endif

" new blowfish2 
if has('patch-7.4.500') || v:version >= 800
	if !has('nvim')
		set cryptmethod=blowfish2
	endif
endif

" enable new-style cursorline (for numbers only)
if exists('+cursorlineopt')
	set cursorlineopt=number cursorline
endif


"----------------------------------------------------------------------
" fixed cursor shaping compatible issues for some terminals
"----------------------------------------------------------------------
if has('nvim')
	set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
	let g:termcap_guicursor = &guicursor
	let g:termcap_t_RS = &t_RS
	let g:termcap_t_SH = &t_SH
	set guicursor=
	set t_RS=
	set t_SH=
endif

" restore last position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" DiffOrig command
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


"----------------------------------------------------------------------
" use ~/.vim/tmp as backup directory
"----------------------------------------------------------------------
if get(g:, 'asc_no_backup', 0) == 0
	set backup
	set writebackup
	set backupdir=~/.vim/tmp
	set backupext=.bak
	set noswapfile
	set noundofile
	let path = expand('~/.vim/tmp')
	if isdirectory(path) == 0
		silent! call mkdir(path, 'p', 0755)
	endif
endif

" Persistent folding information
function! s:fold_restore(enable)
	if a:enable == 'true' || a:enable == 'yes' || a:enable != 0
		augroup VimUnixFoldGroup
			au! 
			au BufWrite,VimLeave * silent! mkview
			au BufRead * silent! loadview
		augroup END
	else
		augroup VimUnixFoldGroup
			au!
		augroup END
	endif
endfunc

command! -nargs=1 PersistFoldEnable call s:fold_restore(<q-args>)

command! -nargs=0 Undiff setlocal nodiff noscrollbind wrap
command! -nargs=1 -complete=file DiffFile vertical diffsplit <args>

" Open junk file.
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
	let junk_dir = asclib#setting#get('junk', '~/.vim/junk')
	let junk_dir = junk_dir . strftime('/%Y/%m')
	let real_dir = expand(junk_dir)
	if !isdirectory(real_dir)
		call mkdir(real_dir, 'p')
	endif
	let filename = junk_dir.strftime('/%Y-%m-%d-%H%M%S.')
	let filename = tr(filename, '\', '/')
	let filename = input('Junk Code: ', filename)
	if filename != ''
		execute 'edit ' . fnameescape(filename)
	endif
endfunction

command! -nargs=0 JunkList call s:open_junk_list()
function! s:open_junk_list()
	let junk_dir = asclib#setting#get('junk', '~/.vim/junk')
	" let junk_dir = expand(junk_dir) . strftime('/%Y/%m')
	let junk_dir = tr(junk_dir, '\', '/')
	echo junk_dir
	exec "Leaderf file " . fnameescape(expand(junk_dir))
endfunction



