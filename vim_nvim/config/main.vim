" Adapted from https://github.com/rafi/vim-config

" Respect XDG
if ! empty($XDG_CONFIG_HOME) && isdirectory($XDG_CONFIG_HOME.'/vim')
  let $VIMPATH=expand('$XDG_CONFIG_HOME/vim')
  let $VARPATH=expand('$XDG_CACHE_HOME/vim')
  let $MYVIMRC=expand('$XDG_CONFIG_HOME/vim/config/vimrc')
  if has('nvim')
    " For Neovim, use .config/vim instead of .config/nvim
    set runtimepath-=$XDG_CONFIG_HOME/nvim
    set runtimepath^=$XDG_CONFIG_HOME/vim
  else
    set runtimepath-=~/.vim
    set runtimepath^=$VIMPATH
    set runtimepath-=~/.vim/after
    set runtimepath+=$VIMPATH/after
  endif
else
  let $VIMPATH=expand('$HOME/.vim')
  let $VARPATH=expand('$HOME/.cache/vim')
endif

function! s:source_file(path) abort
  execute 'source' fnameescape($VIMPATH.'/config/'.a:path)
endfunction

if has('vim_starting')
  " call s:source_file('minimal.vim') " A just-work vim setting for short-term use
  call s:source_file('extended.vim') " A more complicated setting, including the tiny one
endif

call s:source_file('with_plugin.vim')

set secure
" vim: set ts=2 sw=2 tw=80 et :
