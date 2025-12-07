if ! has('user_commands')
    finish
endif

command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis
command! -nargs=1 -complete=help Help      :help <args>
command! -nargs=1 -complete=help HElp      :help <args>
command! -nargs=* -bar -bang     Ls        :ls<bang>
command! -nargs=? -bar -range    Underline :<line1>put =repeat( len('<args>') > 0 ? '<args>' : '=', len(getline('.')))
command! -nargs=0 -bar           Merge     /^\(<\|=\||\|>\)\{7}\ze\(\s\|$\)/
command! -nargs=0 -bar -range=%  Quotes    <line1>,<line2>s/’/'/ge | <line1>,<line2>s/[“”]/"/ge | <line1>,<line2>s/—/ - /ge | <line1>,<line2>s/–/-/ge | <line1>,<line2>s/…/.../ge | <line1>,<line2>s/→/->/ge


" vim:filetype=vim sw=4 foldmethod=marker tw=78 expandtab:
