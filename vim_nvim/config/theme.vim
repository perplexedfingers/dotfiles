scriptencoding utf-8
" Theme {{{
" -----

set background=dark
if exists('+termguicolors')
  " Enable true color
  set termguicolors
  let g:quantum_black=1
  let g:quantum_italics=1
  colorscheme quantum
else
  " Enable 256 color terminal
  set t_Co=256
  colorscheme PaperColor
endif

if has('gui_running')
  set guifont=Monaco:h14
  set guioptions-=r        " Hide the right scrollbar
  set guioptions-=L        " Hide the left scrollbar
  set guioptions-=T
  set guioptions-=e
  set shortmess+=c
  " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set t_vb=
endif

set showbreak=>\

" hightlight column row in respect of textwidth
set colorcolumn=+0

" vim: set ts=2 sw=2 tw=80 et :
