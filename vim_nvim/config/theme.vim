scriptencoding utf-8
" Theme {{{
" -----

if exists('+termguicolors') && $TERM !~# '^rxvt'
  " Enable true color
  set termguicolors
  set background=dark
  colorscheme quantum
else
  " Enable 256 color terminal
  set t_Co=256
  set background=dark
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

set showbreak=\ \ \
set fillchars=vert:│,fold:─

" hightlight column row in respect of textwidth
set colorcolumn=+0

" vim: set ts=2 sw=2 tw=80 et :
