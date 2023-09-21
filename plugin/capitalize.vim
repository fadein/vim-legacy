" Capitalize the first letter of each word on the current line
if ! has('user_commands') && has('eval')
    finish
endif

function! <SID>CapitalizeF(bang, line1, line2)
    let l:save_view = winsaveview()
    if a:bang == "!"
        execute a:line1 .. "," .. a:line2 ..  'substitute/\(\i\+\)/\u\L&/eg'
    else
        execute a:line1 .. "," .. a:line2 ..  'substitute/\(\i\+\)/\u&/eg'
    endif
    call winrestview(l:save_view)
endfunction

command! -nargs=0 -bar -bang -range Capitalize   :call <SID>CapitalizeF("<bang>", <line1>, <line2>)

" vim:filetype=vim sw=4 foldmethod=marker tw=78 expandtab:
