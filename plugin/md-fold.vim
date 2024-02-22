function! MarkdownLevel()
    " if getline(v:lnum) =~ '^# .*$'
    "    return ">1"
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    elseif getline(v:lnum) =~ '^### .*$'
        return ">3"
    elseif getline(v:lnum) =~ '^#### .*$'
        return ">4"
    elseif getline(v:lnum) =~ '^##### .*$'
        return ">5"
    elseif getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

au FileType markdown setlocal foldexpr=MarkdownLevel()
au FileType markdown setlocal foldmethod=expr
