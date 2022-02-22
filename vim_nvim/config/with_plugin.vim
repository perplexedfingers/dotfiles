if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('$HOME/.cache/vim/dein'))
" Let dein manage dein
call dein#add('/home/ray/.cache/vim/dein/repos/github.com/Shougo/dein.vim')
execute "source ".fnameescape(expand('$HOME/.vim/config/install_plugin.vim'))
call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

execute "source ".fnameescape(expand('$HOME/.vim/config/config_plugin.vim'))
