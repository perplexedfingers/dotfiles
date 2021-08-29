let s:save_cpo = &cpo
set cpo&vim

set number
filetype plugin indent on
syntax on
set autoindent

let &cpo = s:save_cpo
unlet s:save_cpo
