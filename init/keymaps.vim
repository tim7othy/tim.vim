"======================================================================
"
" keymaps.vim - keymaps start with using <space>
"
" Created by skywind on 2016/10/12
" Last Modified: 2018/05/02 13:05
"
"======================================================================

" replace
noremap <space>p viw"0p
noremap <space>y yiw

" fast save
noremap <m-s> :w<cr>
inoremap <m-s> <esc>:w<cr>
noremap <C-S> :w<cr>
inoremap <C-S> <ESC>:w<cr>

" folding
nnoremap <m-z> za
nnoremap <m-Z> zA

"----------------------------------------------------------------------
" tab switching
"----------------------------------------------------------------------
let s:array = [')', '!', '@', '#', '$', '%', '^', '&', '*', '(']
for i in range(10)
	let x = (i == 0)? 10 : i
	let c = s:array[i]
	exec "noremap <silent><M-".i."> :tabn ".x."<cr>"
	exec "inoremap <silent><M-".i."> <ESC>:tabn ".x."<cr>"
	if get(g:, 'vim_no_meta_shift_num', 0) == 0
		exec "noremap <silent><M-".c."> :tabn ".x."<cr>"
		exec "inoremap <silent><M-".c."> <ESC>:tabn ".x."<cr>"
	endif
endfor

noremap <silent><m-t> :tabnew<cr>
inoremap <silent><m-t> <ESC>:tabnew<cr>
noremap <silent><m-w> :tabclose<cr>
inoremap <silent><m-w> <ESC>:tabclose<cr>


"----------------------------------------------------------------------
" fast window switching: ALT+SHIFT+HJKL
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	set termwinkey=<c-_>
	tnoremap <m-H> <c-_>h
	tnoremap <m-L> <c-_>l
	tnoremap <m-J> <c-_>j
	tnoremap <m-K> <c-_>k
	tnoremap <m-q> <c-\><c-n>
	tnoremap <m-1> <c-_>1gt
	tnoremap <m-2> <c-_>2gt
	tnoremap <m-3> <c-_>3gt
	tnoremap <m-4> <c-_>4gt
	tnoremap <m-5> <c-_>5gt
	tnoremap <m-6> <c-_>6gt
	tnoremap <m-7> <c-_>7gt
	tnoremap <m-8> <c-_>8gt
	tnoremap <m-9> <c-_>9gt
	tnoremap <m-0> <c-_>10gt
elseif has('nvim')
	tnoremap <m-H> <c-\><c-n><c-w>h
	tnoremap <m-L> <c-\><c-n><c-w>l
	tnoremap <m-J> <c-\><c-n><c-w>j
	tnoremap <m-K> <c-\><c-n><c-w>k
	tnoremap <m-q> <c-\><c-n>
	tnoremap <m-1> <c-\><c-n>1gt
	tnoremap <m-2> <c-\><c-n>2gt
	tnoremap <m-3> <c-\><c-n>3gt
	tnoremap <m-4> <c-\><c-n>4gt
	tnoremap <m-5> <c-\><c-n>5gt
	tnoremap <m-6> <c-\><c-n>6gt
	tnoremap <m-7> <c-\><c-n>7gt
	tnoremap <m-8> <c-\><c-n>8gt
	tnoremap <m-9> <c-\><c-n>9gt
	tnoremap <m-0> <c-\><c-n>10gt
endif

"----------------------------------------------------------------------
" text-objects
"----------------------------------------------------------------------
onoremap az :<c-u>normal! ggVG<cr>
vnoremap az ogg0oG$
onoremap il :<c-u>normal! v$o^oh<cr>
vnoremap il $o^oh

"----------------------------------------------------------------------
" leader + b/c : buffer
"----------------------------------------------------------------------
noremap <silent><leader>bc :BufferClose<cr>
noremap <silent><leader>cw :CdToFileDir<cr>
noremap <silent><leader>cr :CdToProjectRoot<cr>

"----------------------------------------------------------------------
" space + h : fast open files
"----------------------------------------------------------------------
let $RTP = expand('<sfile>:p:h:h')
nnoremap <silent><space>hk :FileSwitch $RTP/init/keymaps.vim<cr>
nnoremap <silent><space>hs :FileSwitch $RTP/skywind.vim<cr>
nnoremap <silent><space>hv :FileSwitch $RTP/bundle.vim<cr>
nnoremap <silent><space>hc :FileSwitch $RTP/autoload/asclib.vim<cr>
nnoremap <silent><space>hu :FileSwitch $RTP/autoload/auxlib.vim<cr>

let s:nvimrc = expand("~/.config/nvim/init.vim")
if has('win32') || has('win16') || has('win95') || has('win64')
	let s:nvimrc = expand("~/AppData/Local/nvim/init.vim")
endif
exec 'nnoremap <space>hn :FileSwitch '.fnameescape(s:nvimrc).'<cr>'





