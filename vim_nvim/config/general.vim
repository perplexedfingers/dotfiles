"  intainer:   Liu-Cheng Xu <https://github.com/liuchengxu>
" Version:"M      0.1
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

if &compatible ||
      \ (exists('g:loaded_vim_better_default') && g:loaded_vim_better_default)
   finish
endif
let g:loaded_vim_better_default = 1

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
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe            " Windows


" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

if exists('g:vim_better_default_minimum') && g:vim_better_default_minimum
  finish
endif

if exists('g:vim_better_default_backup_on') && g:vim_better_default_backup_on
  set backup
else
  set nobackup
  set noswapfile
  set nowritebackup
endif

set background=dark           " Assume dark background
set cursorline                " Highlight current line
set fileformats=unix,dos,mac  " Use Unix as the standard file type
set number                    " Line numbers on
set relativenumber            " Relative numbers on
set linebreak
set foldenable
set foldlevel=3
set foldmethod=syntax
set foldcolumn=3

highlight clear SignColumn
highlight clear LineNr

if ( ! has('nvim') || $DISPLAY !=? '') && has('clipboard')
  if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif
endif

if !exists('g:vim_better_default_persistent_undo') ||
      \ g:vim_better_default_persistent_undo
  if has('persistent_undo')
    set undofile             " Persistent undo
    set undolevels=1000      " Maximum number of changes that can be undone
    set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
  endif
endif

set timeout ttimeout
set timeoutlen=750  " Time out on mappings
set ttimeoutlen=250 " Time out on key codes
set updatetime=1500 " Idle time to write swap and trigger CursorHold

if has('nvim')
  " https://github.com/neovim/neovim/issues/2017
  set ttimeoutlen=-1
endif

" Key (re)Mappings {

  if !exists('g:vim_better_default_key_mapping') ||
        \ g:vim_better_default_key_mapping

    " Basic {
      " if !exists('g:vim_better_default_basic_key_mapping') ||
      "       \ g:vim_better_default_basic_key_mapping
      "   " Quit normal mode
      "   nmap <Leader>q  :q<CR>
      "   nmap <Leader>Q  :qa!<CR>
      "   " Move half page faster
      "   nmap <Leader>d  <C-d>
      "   nmap <Leader>u  <C-u>
      "   " Insert mode shortcut
      "   inoremap <C-h> <Left>
      "   inoremap <C-j> <Down>
      "   inoremap <C-k> <Up>
      "   inoremap <C-l> <Right>
      "   inoremap <C-d> <Delete>
      "   " Quit insert mode
      "   inoremap jj <Esc>
      "   inoremap jk <Esc>
      "   inoremap kk <Esc>
      "   inoremap ;; <Esc>
      "   " Quit visual mode
      "   vnoremap v <Esc>
      "   " Move to the start of line
      "   nnoremap H ^
      "   " Move to the end of line
      "   nnoremap L $
      "   " Redo
      "   nnoremap U <C-r>
      "   " Yank to the end of line
      "   nnoremap Y y$
      "  " Auto indent pasted text
      "   nnoremap p p=`]<C-o>
      "   " Open shell in vim
      "   map <Leader>' :shell<CR>
      "   " Search result highlight countermand
      "   nnoremap <Leader>sc :nohlsearch<CR>
      "   " Toggle pastemode
      "   nnoremap <Leader>tp :setlocal paste!<CR>
      " endif
    " }

    " Buffer {
      " if !exists('g:vim_better_default_buffer_key_mapping') ||
      "       \ g:vim_better_default_buffer_key_mapping
      "   nnoremap <Leader>bb :buffers<CR>
      "   nnoremap <Leader>bp :bprevious<CR>
      "   nnoremap <Leader>bn :bnext<CR>
      "   nnoremap <Leader>bf :bfirst<CR>
      "   nnoremap <Leader>bl :blast<CR>
      "   nnoremap <Leader>bd :bd<CR>
      "   nnoremap <Leader>bk :bw<CR>
      "   nnoremap <Leader>1 :b1<CR>
      "   nnoremap <Leader>2 :b2<CR>
      "   nnoremap <Leader>3 :b3<CR>
      "   nnoremap <Leader>4 :b4<CR>
      "   nnoremap <Leader>5 :b5<CR>
      "   nnoremap <Leader>6 :b6<CR>
      "   nnoremap <Leader>7 :b7<CR>
      "   nnoremap <Leader>8 :b8<CR>
      "   nnoremap <Leader>9 :b9<CR>
      " endif
    " }

    " File {
      " if !exists('g:vim_better_default_file_key_mapping') ||
      "       \ g:vim_better_default_file_key_mapping
      "   " File save
      "   nnoremap <Leader>fs :w<CR>
      " endif
    " }

    " Fold {
      " if !exists('g:vim_better_default_fold_key_mapping') ||
      "       \ g:vim_better_default_fold_key_mapping
      "   nnoremap <Leader>f0 :set foldlevel=0<CR>
      "   nnoremap <Leader>f1 :set foldlevel=1<CR>
      "   nnoremap <Leader>f2 :set foldlevel=2<CR>
      "   nnoremap <Leader>f3 :set foldlevel=3<CR>
      "   nnoremap <Leader>f4 :set foldlevel=4<CR>
      "   nnoremap <Leader>f5 :set foldlevel=5<CR>
      "   nnoremap <Leader>f6 :set foldlevel=6<CR>
      "   nnoremap <Leader>f7 :set foldlevel=7<CR>
      "   nnoremap <Leader>f8 :set foldlevel=8<CR>
      "   nnoremap <Leader>f9 :set foldlevel=9<CR>
      " endif
    " }

    " Window {
      " if !exists('g:vim_better_default_window_key_mapping') ||
      "       \ g:vim_better_default_window_key_mapping
      "   nnoremap <Leader>ww <C-W>w
      "   nnoremap <Leader>wr <C-W>r
      "   nnoremap <Leader>wd <C-W>c
      "   nnoremap <Leader>wq <C-W>q
      "   nnoremap <Leader>wj <C-W>j
      "   nnoremap <Leader>wk <C-W>k
      "   nnoremap <Leader>wh <C-W>h
      "   nnoremap <Leader>wl <C-W>l
      "   nnoremap <Leader>w= <C-W>=
      "   nnoremap <Leader>ws <C-W>s
      "   nnoremap <Leader>w- <C-W>s
      "   nnoremap <Leader>wv <C-W>v
      "   nnoremap <Leader>w\| <C-W>v
      "   nnoremap <Leader>w2 <C-W>v
      " endif
    " }

  endif

" }

let &cpoptions = s:save_cpo
unlet s:save_cpo
