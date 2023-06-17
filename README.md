# Legacy Vim Resources

*Updated for 2023*

This repo is now intended to be used with Junegunn Choi's [vim-plug](https://github.com/junegunn/vim-plug)


## Quickstart

Add this to your `~/.vim/vimrc` and start a new Vim instance:

```
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'fadein/vim-legacy'
call plug#end()
```

## See also

https://github.com/fadein/dotvim
