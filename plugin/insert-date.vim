function! s:InsertCommentDate(line1, line2, bang)
    let l:date = strftime('Date: %a %b %e %Y')
    if &commentstring =~ '%s'
        let l:date = substitute(&commentstring, '%s', l:date, '')
    endif

    " Decide where to insert and which line to inspect for indentation
    let l:target = a:bang ? a:line1 - 1 : a:line2

    " Insert the comment with indentation level copied from the target line
    call append(l:target, matchstr(getline(l:target), '^\s*') .. l:date)
endfunction

command! -range -bang -nargs=0 Date call <SID>InsertCommentDate(<line1>, <line2>, <bang>0)
