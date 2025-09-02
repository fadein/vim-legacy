" Command Trim trims trailing whitespace from every line in a file
if ! has('user_commands') && has('eval')
    finish
endif

function! <SID>TrimF()
    let l:save_view = winsaveview()

    " trim trailing spaces from lines
    %substitute/\s\+$//e

    " scanning from the bottom up, trim trailing blank lines
    if getline("$") == ""
        let l:bottom = getpos("$")[1]
        let l:top = l:bottom - 1

        while l:top > 0 && getline(l:top) == ""
            let l:top -= 1
        endwhile
        let l:top += 1

        call deletebufline("%", l:top, l:bottom)
    endif

    call winrestview(l:save_view)
endfunction

command! -bar -nargs=0 Trim   :call <SID>TrimF()

" vim:filetype=vim sw=4 foldmethod=marker tw=78 expandtab:
