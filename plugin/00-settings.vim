if exists("+autochdir")
    set noautochdir
endif

if has('folding')
    set foldmethod=indent
endif

"I never use a white terminal
if !has('gui_running')
    set background=dark
endif

if !has('nvim')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    set cscopetag
    set undodir=~/.vim/undo
    set viminfo='100,<50,s10,h,n~/.vim/viminfo
    if has('cursorshape') && &term =~ '\(rxvt-unicode\)\|\(xterm\)'
        let &t_SI = "\e[6 q"
        let &t_SR = "\e[4 q"
        let &t_EI = "\e[2 q"
    endif
else
    set viminfo='100,<50,s10,h,n~/.local/share/nvim/viminfo
    set undodir=~/.local/share/nvim/undo
endif


"sort this block with the following command:
" .,/endsettings/-1sort /^"\?set\s\(no\)\?/
set autoindent
set autowrite  "writes file before I :make it
set backspace=indent,eol,start  "lets you use backspace on previously inserted words
set nobackup
set belloff=all
set cdhome
set nocindent
set comments=s1:/*,mbx:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:- " is this right?
set nocompatible
set cpoptions=BadFAces
set cursorline
set directory^=~/.vim/swp//
set expandtab
set nofoldenable
set formatoptions=tcqron
set grepformat=%f:%l:%m
set grepprg=grep\ -HnEi
set hidden
set history=200
set hlsearch
set ignorecase
set incsearch
set isfname-==
set keymodel=startsel,stopsel
set laststatus=2 "make sure status line always appears, regardless of splits
set linebreak
set matchpairs=(:),{:},[:],<:>
set matchtime=3
set modeline  "activate modelines
set mouse=
set nrformats=hex
set number
set ruler
set scrolloff=0
set shiftwidth=4
set shortmess=aoOTt
set showcmd
set smartcase
set nosmartindent
set smoothscroll
set spellfile=$HOME/.vim/spell/local.en.add
set spelloptions=camel
set spellsuggest=best,5
set splitbelow
set splitkeep=screen
set splitright
set nostartofline
set statusline=%m%f%a\ %y%r%w\ %=%l/%L\ %P
set switchbuf=useopen
set tabstop=4
set tags=tags
set notildeop  " don't need this because g~ is already an operator
set title
set undofile
set virtualedit=block
set whichwrap=b,s,<,>,[,]
set nowildmenu
set wildmode=list:longest,full
set wrap
"endsettings

"settings to fix dreaded un-indenting of lines beginning with #
set autoindent
inoremap # X#

if has('syntax')
    syntax enable
    highlight Folded     term=standout ctermfg=12 ctermbg=None
    highlight CursorLine term=underline cterm=underline
    if &t_Co >= 88
        highlight Search    cterm=NONE ctermfg=0 ctermbg=119 guifg=Black guibg=Yellow
        highlight IncSearch cterm=NONE ctermfg=0 ctermbg=119 guifg=Black guibg=Yellow
    endif
endif

if has('eval')
    filetype plugin indent on
endif

" vim:filetype=vim sw=4 foldmethod=marker tw=78 expandtab:
