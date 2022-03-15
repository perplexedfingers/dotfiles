if &compatible
  set nocompatible
endif

call plug#begin()
execute "source ".fnameescape(expand('$HOME/.vim/config/install_plugin.vim'))
call plug#end()

execute "source ".fnameescape(expand('$HOME/.vim/config/config_plugin.vim'))
