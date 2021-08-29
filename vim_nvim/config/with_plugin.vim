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

" Setup dein
if executable('git')
  " Install dein
  if &runtimepath !~# '/dein.vim'
    let s:dein_dir = expand('$VARPATH/dein').'/repos/github.com/Shougo/dein.vim'
    if ! isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif

    execute 'set runtimepath+='.substitute(
      \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
  endif

  " Initialize dein.vim
  let s:path = expand('$VARPATH/dein')
  if dein#load_state(s:path)
    call dein#begin(s:path, [
      \ expand('<sfile>'),
      \ expand('$VIMPATH/config/install_plugin.vim')
      \ ])

    call s:source_file('install_plugin.vim')

    if isdirectory(expand('$VIMPATH/dev'))
      call dein#local(expand('$VIMPATH/dev'), {'frozen': 1, 'merged': 0})
    endif
    call dein#end()
    call dein#save_state()
    if dein#check_install()
      if ! has('nvim')
        set nomore
      endif
      call dein#install()
    endif
  endif

  call s:source_file('config_plugin.vim')

  autocmd VimEnter * call dein#call_hook('post_source')
  autocmd VimEnter * call dein#call_hook('source')

  filetype plugin indent on
  syntax enable
endif
