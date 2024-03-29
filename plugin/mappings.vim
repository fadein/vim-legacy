"" " execute the current line of text as a shell command
noremap  Q !!$SHELL<CR>


" date

" fortune philosoraptor

" echo "actual password" | figlet | base64 | base64 -d

"" " execute the current selection as shell commands
vnoremap Q  !$SHELL<CR>

" {
" echo True story: | figlet -f small -c
"       cat <<-: | WIDTH=30 pms quote
"               Use the Force, Harry!
"               -- Gandalf
"               :
" } | pms centerBlock

function! <SID>Ranger(c)
    let l:leader = '\'
    if exists('mapleader')
        let l:leader = mapleader
    endif
    if getcmdpos() != 1
        return l:leader . a:c
    else
        return "'[,']"
    endif
endfunction

" <leader>: begins command mode with the '[,'] range, á là {Visual}:
noremap  <leader>: :'[,']
cnoremap <expr> <leader>:  <SID>Ranger(':')


" Command-line mode mapping for alt-v
" Replace the command-line with the text beneath the cursor in the buffer
" :help c_CTRL-\_e
cnoremap <Esc>q <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>
cnoremap <Esc>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>

" Use <C-L> to clear search highlighting and redraw the screen
noremap  <silent> <C-l>      :nohlsearch <bar> redraw!<CR>
inoremap <silent> <C-l> <C-O>:nohlsearch <bar> redraw!<CR>

" Prevent F1 from bringing up the help screen
map  <F1> <Nop>
imap <F1> <Nop>
cmap <F1> <Nop>
smap <F1> <Nop>

" F4 close the quickfix error window, cleaning up sign column
noremap  <F4>      :sign unplace *<CR> <bar> :cclose<CR>
inoremap <F4> <C-O>:sign unplace *<CR>

" F5 Emulate VisualStudio "build project" hotkey
noremap  <F5>      :make<CR>
inoremap <F5> <C-O>:make<CR>

" Widescreen optimization: open tags in a vertical split
nnoremap <C-w>] :execute "vert stag " . expand("<cword>")<CR>

" vim:filetype=vim expandtab tabstop=4 shiftwidth=4 textwidth=78 foldmethod=marker:
