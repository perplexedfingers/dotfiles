if has('nvim')
  finish
endif

if exists('$TMUX') "{{{
  set ttyfast
  set ttymouse=sgr
"}}}
else "{{{
  set ttymouse=urxvt
endif "}}}

" vim: set ts=2 sw=2 tw=80 et :
