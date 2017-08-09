"  intainer:   Liu-Cheng Xu <https://github.com/liuchengxu>
" Version:"M      0.1
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

let s:save_cpo = &cpoptions
set cpoptions&vim

" Neovim has set these as default
if !has('nvim')

  set nocompatible

  syntax on                      " Syntax highlighting
  filetype plugin indent on      " Automatically detect file types
  set autoindent                 " Indent at the same level of the previous line
  set autoread                   " Automatically read a file changed outside of vim
  set backspace=indent,eol,start " Backspace for dummies
  set display=lastline           " Show as much as possible of the last line
  set encoding=utf-8             " Set default encoding
  set history=10000              " Maximum history record
  set hlsearch                   " Highlight search terms
  set incsearch                  " Find as you type search
  set laststatus=2               " Always show status line
  set mouse=a                    " Automatically enable mouse usage
  set smarttab                   " Smart tab
  set ttyfast                    " Faster redrawing
  set viminfo+=!                 " Viminfo include !
  set wildmenu                   " Show list instead of just completing
  set ttymouse=xterm2

endif

set lazyredraw                 " redraw on-demand
set showfulltag                " Show tag and tidy search in completion
set complete-=i                " Exclude files completion
set completeopt=menuone        " Show menu even for one item
set completeopt+=noselect      " Do not select a match in the menu
set shortmess=atI     " No help Uganda information
set ignorecase        " Case sensitive search
set smartcase         " Case sensitive when uc present
set scrolljump=5      " Line to scroll when cursor leaves screen
set scrolloff=3       " Minumum lines to keep above and below cursor
set sidescrolloff=6   " Keep lines left/right
set nowrap            " Do not wrap long lines
set shiftwidth=4      " Use indents of 4 spaces
set expandtab         " Tabs are spaces, not tabs
set tabstop=4         " An indentation every four columns
set softtabstop=4     " Let backspace delete indent
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current
set autowrite         " Automatically write a file when leaving a modified buffer
set mousehide         " Hide the mouse cursor while typing
set hidden            " Allow buffer switching without saving
set ruler             " Show the ruler
set showcmd           " Show partial commands in status line and Selected characters/lines in visual mode
set showmode          " Show current mode in command-line
set showmatch         " Show matching brackets/parentthesis
set matchtime=5       " Show matching time
set report=0          " Always report changed lines
set linespace=0       " No extra spaces between rows
set magic             " For regular expressions turn magic on
set virtualedit=block " Position cursor anywhere in visual block
set formatoptions+=1  " Don't break lines after a one-letter word
set formatoptions-=t  " Don't auto-wrap text
set synmaxcol=1000    " Don't syntax highlight long lines

set winminheight=0
set wildmode=list:longest,full

set listchars=tab:>-,extends:>,precedes:<,nbsp:‡,trail:~,eol:$

set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom

set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe            " Windows

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee > /dev/null %

set background=dark           " Assume dark background
set cursorline                " Highlight current line
set fileformats=unix,dos,mac  " Use Unix as the standard file type
set number                    " Line numbers on
set relativenumber            " Relative numbers on
set linebreak
set foldenable
set foldlevelstart=3
set foldnestmax=10
set foldmethod=syntax

highlight clear SignColumn
highlight clear LineNr

if has('clipboard')
  if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif
endif

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set undofile             " Persistent undo
set undolevels=1000      " Maximum number of changes that can be undone
set undoreload=10000     " Maximum number lines to save for undo on a buffer reload

set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set ttimeoutlen=250 " Time out on key codes
set updatetime=1500 " Idle time to write swap and trigger CursorHold

if has('nvim')
  " https://github.com/neovim/neovim/issues/2017
  set ttimeoutlen=-1
endif

let &cpoptions = s:save_cpo
unlet s:save_cpo
