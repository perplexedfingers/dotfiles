augroup MyAutoCmd

  " Check timestamp on window enter. More eager than 'autoread'
  autocmd WinEnter * checktime

  " If session is loaded, write session file on quit
  autocmd VimLeavePre *
    \ if ! empty(v:this_session) && ! exists('g:SessionLoad')
    \ |   execute 'mksession! '.fnameescape(v:this_session)
    \ | endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
    \|   exe 'normal! g`"zvzz'
    \| endif

  " Disable paste and/or update diff when leaving insert mode
  autocmd InsertLeave *
    \ if &paste | setlocal nopaste mouse=a | echo 'nopaste' | endif |
    \ if &l:diff | diffupdate | endif

  " Open Quickfix window automatically
  autocmd QuickFixCmdPost [^l]* leftabove copen
    \ | wincmd p | redraw!
  autocmd QuickFixCmdPost l* leftabove lopen
    \ | wincmd p | redraw!

  " Fix window position of help/quickfix
  autocmd FileType help if &l:buftype ==# 'help'
    \ | wincmd K | endif
  autocmd FileType qf   if &l:buftype ==# 'quickfix'
    \ | wincmd J | endif

augroup END

" vim: set ts=2 sw=2 tw=80 et :
