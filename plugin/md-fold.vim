function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return "0"
    elseif getline(v:lnum) =~ '^## .*$'
        return ">1"
    elseif getline(v:lnum) =~ '^### .*$'
        return ">2"
    elseif getline(v:lnum) =~ '^#### .*$'
        return ">3"
    elseif getline(v:lnum) =~ '^##### .*$'
        return ">4"
    elseif getline(v:lnum) =~ '^###### .*$'
        return ">5"
    endif
    return "="
endfunction

augroup markdown-fold
    autocmd!
    autocmd FileType markdown setlocal foldmethod=expr
    autocmd FileType markdown setlocal foldexpr=MarkdownLevel()
    autocmd FileType markdown setlocal foldenable
augroup END
