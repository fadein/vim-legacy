if ! has('user_commands')
    finish
endif

command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis
command! -nargs=1 -complete=help Help      :help <args>
command! -nargs=1 -complete=help HElp      :help <args>
command! -nargs=* -bar -bang Ls            :ls<bang>
command! -nargs=0 Date      :put ='* ' . strftime('%b %d, %Y %I:%M %p')
command! -nargs=? -bar Underline    :put =repeat( len('<args>') > 0 ? '<args>' : '=', len(getline('.')))
command! -nargs=0 Merge     /^\(<\|=\||\|>\)\{7}\ze\(\s\|$\)/
command! -nargs=0 Quotes    :%s/’/'/ge | :%s/[“”]/"/ge | :%s/—/ - /ge | :%s/–/-/ge

" vim:filetype=vim sw=4 foldmethod=marker tw=78 expandtab:
