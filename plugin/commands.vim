"----------------------------------------------------------------------
" Follow switchbuf option to open a file
" usage: 
"     :FileSwitch abc.txt
"     :FileSwitch -switch=useopen,usetab,auto abc.txt
"     :FileSwitch -switch=useopen -mods=botright abc.txt
"----------------------------------------------------------------------
command! -nargs=+ -complete=file FileSwitch 
    \ call s:FileSwitch('<mods>', [<f-args>])
function! s:FileSwitch(mods, args)
    let args = deepcopy(a:args)
    if a:mods != ''
        let args = ['-mods=' . a:mods] + args
    endif
    call asclib#utils#file_switch(args)
endfunc


"----------------------------------------------------------------------
" Switch cpp/h file
"----------------------------------------------------------------------
command! -nargs=* -complete=customlist,module#alternative#complete
    \ SwitchHeader call module#alternative#switch('<mods>', [<f-args>])


