if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('$HOME/.cache/vim/dein'))
execute "source ".fnameescape(expand('$HOME/.vim/config/install_plugin.vim'))
call dein#end()

if dein#check_install()
  call dein#install()
endif

execute "source ".fnameescape(expand('$HOME/.vim/config/config_plugin.vim'))

autocmd VimEnter * call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')

filetype plugin indent on
syntax enable
