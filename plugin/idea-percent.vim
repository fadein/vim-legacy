" Calculate the IDEA response rate across multiple sections
" and insert the message at the current line

if ! has('user_commands') && has('eval')
    finish
endif


function! <SID>CalculateIDEA(...)
    let l:enrollment = 0
    let l:respondents = 0
    let l:i = 0

    if l:i + 1 > len(a:000)
        echoerr "Usage: IDEA [response% enrollment] ..."
        return
    endif

    while l:i + 1 <= len(a:000)
        let l:pct = a:000[i] / 100.0
        let l:enrollment += a:000[i+1]
        let l:respondents += ceil(l:pct * a:000[i+1])
        let l:i += 2
    endwhile

    call append(line('.'),
                \printf("*   So far we're at a %d%% response rate!",
                \       float2nr(l:respondents * 100 / l:enrollment)))
endfunction

command! -nargs=* IDEA :call <SID>CalculateIDEA(<f-args>)
