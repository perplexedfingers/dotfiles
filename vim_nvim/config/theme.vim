scriptencoding utf-8

if exists('+termguicolors')
  set termguicolors
else
  set t_Co=256
endif

set background=dark
colorscheme spring-night

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

set signcolumn=yes

" vim: set ts=2 sw=2 tw=80 et :
