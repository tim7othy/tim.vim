function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use `<Tab>`/`<S-Tab>` to navigate between suggestions
"
" inoremap <silent><expr> <TAB>
" 	\ coc#pum#visible() ? coc#pum#next(1):
" 	\ <SID>check_back_space() ? "\<TAB>" :
" 	\ coc#refresh()
"
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

" use `<cr>` and `<TAB>` to confirm the complete item
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm():
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#_select_confirm():
	\ <SID>check_back_space() ? "\<TAB>" :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" use `<c-f>` to jump to next snippet position in insert mode
let g:coc_snippet_next = '<C-f>'
" use `<c-b>` to jump to previous snippet position in insert mode
let g:coc_snippet_prev = '<C-b>'

" use `<c-k>` to force trigger complete
inoremap <silent><expr> <c-k> coc#refresh()

" use `[d` and `]d` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to type definition
nmap <silent> gt <Plug>(coc-type-definition)
" go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" go to references
nmap <silent> gr <Plug>(coc-references)

" run code format (async) on current buffer or visual selection
nmap <leader>cf  <Plug>(coc-format)
xmap <leader>cf  <Plug>(coc-format-selected)

" apply code action on current cursor position or visual selection
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
xmap <leader>ca  <Plug>(coc-codeaction-selected)
