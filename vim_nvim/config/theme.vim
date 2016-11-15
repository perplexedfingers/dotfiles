scriptencoding utf-8
" Theme {{{
" -----


" Enable true color
if exists('+termguicolors')
  set termguicolors
else
  " Enable 256 color terminal
  set t_Co=256
endif

if exists('+termguicolors')
  set background=dark
  colorscheme quantum
else
  set background=dark
  colorscheme PaperColor
endif

if has('gui_running')
  set guifont=Monaco:h14
endif

set showbreak=\ \ \
set fillchars=vert:│,fold:─

" vim: set ts=2 sw=2 tw=80 et :
