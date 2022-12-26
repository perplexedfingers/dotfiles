" A just-work vim setting for short-term use
" execute "source ".fnameescape('minimal.vim')

" A more complicated setting, including 'minimal'
execute "source ".fnameescape(expand('$HOME/.vim/config/extended.vim'))

execute "source ".fnameescape(expand('$HOME/.vim/config/with_plugin.vim'))

set secure
" vim: set ts=2 sw=2 tw=80 et :
