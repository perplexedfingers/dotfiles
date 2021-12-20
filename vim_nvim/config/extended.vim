let s:save_cpo = &cpo
set cpo&vim

function! s:lazy_load_filetype() abort
  redir => l:filetype_out
  silent! filetype
  redir END
  if l:filetype_out =~# 'OFF'
    silent! filetype plugin indent on
    syntax enable
    filetype detect
  endif
endfunction

" Set augroup
augroup MyAutoCmd
  autocmd!
  " Lazy-loading filetype syntax and highlighting
  autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead
        \ * call s:lazy_load_filetype()
augroup END

if !has('nvim')
  set nocompatible
  filetype plugin indent on
  syntax on
  set autoindent
  set autoread                   " Automatically read a file changed outside of vim
  set backspace=indent,eol,start " Backspace for dummies
  set complete-=i                " Exclude files completion
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

  if exists('$TMUX')
    set ttymouse=sgr
  else
    set ttymouse=urxvt
  endif

  " Annoying temporary files
  set directory=/tmp//,.
  set backupdir=/tmp//,.
  if v:version >= 703
    set undodir=/tmp//,.
  endif
else
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
  " Write history on idle
  augroup MyAutoCmd
    autocmd CursorHold * if exists(':rshada') | rshada | wshada | endif
  augroup END
endif

if ! empty($XDG_CONFIG_HOME) && isdirectory($XDG_CONFIG_HOME.'/vim')
  let $VARPATH=expand('$XDG_CACHE_HOME/vim')
else
  let $VARPATH=expand('$HOME/.cache/vim')
endif
let $SWAP_DIR=expand($VARPATH.'/swap')
let $UNDO_DIR=expand($VARPATH.'/undo')
let $BACKUP_DIR=expand($VARPATH.'/backup')
call mkdir($SWAP_DIR, 'p')
call mkdir($UNDO_DIR, 'p')
call mkdir($BACKUP_DIR, 'p')
set directory=$SWAP_DIR,.
set backupdir=$BACKUP_DIR,.
set undodir=$UNDO_DIR,.
set backup

if has('gui_running')
  set guioptions=Mc        " Disable menu.vim
  set guioptions-=r        " Hide the right scrollbar
  set guioptions-=L        " Hide the left scrollbar
  set guioptions-=T
  set guioptions-=e
  set shortmess+=c
  " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set visualbell t_vb=
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow
endif

" Change cursor shape for iTerm2 on macOS {
" bar in Insert mode
" inside iTerm2
if $TERM_PROGRAM =~# 'iTerm'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" inside tmux
if exists('$TMUX') && $TERM != 'xterm-kitty'
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif
" }

if exists('+termguicolors')
  set termguicolors
else
  set t_Co=256
endif

if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

if has('persistent_undo')
  set undofile             " Persistent undo
  set undolevels=1000      " Maximum number of changes that can be undone
  set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
endif

" Disable pre-bundled plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_LogiPat = 1
let g:loaded_logipat = 1
let g:loaded_man = 1
let g:loaded_matchit = 0
let g:loaded_matchparen = 0
let g:loaded_netrw = 0
let g:loaded_netrwPlugin = 0
let g:loaded_netrwFileHandlers = 0
let g:loaded_netrwSettings = 0
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set ignorecase     " Case insensitive search
set smartcase      " ... but case sensitive when uc present
set scrolljump=5   " Line to scroll when cursor leaves screen
set scrolloff=3    " Minumum lines to keep above and below cursor
set nowrap         " Do not wrap long lines
set shiftwidth=4   " Use indents of 4 spaces
set tabstop=4      " An indentation every four columns
set softtabstop=4  " Let backspace delete indent
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the current
set autowrite      " Automatically write a file when leaving a modified buffer
set mousehide      " Hide the mouse cursor while typing
set hidden         " Allow buffer switching without saving
set showbreak=>\
set colorcolumn=+0 " hightlight column row in respect of textwidth
set signcolumn=yes
set ruler          " Show the ruler
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set linespace=0    " No extra spaces between rows
set pumheight=20   " Avoid the pop up menu occupying the whole screen
set expandtab      " Tabs are spaces, not tabs
set number

" http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set t_ut=

set winminheight=0
set wildmode=list:longest,full

set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe            " Windows

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

set foldenable
set foldmarker={,}
set foldlevel=0
set foldmethod=marker
" set foldcolumn=3
set foldlevelstart=99

set background=dark         " Assume dark background
set cursorline              " Highlight current line
set fileformats=unix,dos,mac        " Use Unix as the standard file type
set fillchars=stl:\ ,stlnc:\ ,fold:\ ,vert:│
" set relativenumber          " Relative numbers on

highlight clear SignColumn  " SignColumn should match background
highlight clear LineNr      " Current line number row will have same background color in relative mode

function! s:source_file(path) abort
  execute 'source' fnameescape($VIMPATH.'/config/'.a:path)
endfunction

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

" Loading configuration modules
call s:source_file('filetype.vim')
call s:lazy_load_filetype()
call s:source_file('bindings.vim')
call s:source_file('statusline.vim')

let &cpo = s:save_cpo
unlet s:save_cpo
