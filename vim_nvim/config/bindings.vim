nnoremap , <Nop>
xnoremap , <Nop>
let g:mapleader=","

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk

" Key (re)Mappings {

" Global niceties {{{
" ---------------
" Fix keybind name for Ctrl+Spacebar
map <Nul> <C-Space>
map! <Nul> <C-Space>

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" Disable EX-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" Disable recording
nnoremap q <Nop>

" " Navigation in command line
" cnoremap <C-j> <Left>
" cnoremap <C-k> <Right>
" cnoremap <C-h> <Home>
" cnoremap <C-l> <End>
" cnoremap <C-f> <Right>
" cnoremap <C-b> <Left>
" cnoremap <C-d> <C-w>

" }}}

" Totally Custom {{{
" --------------

" Remove spaces at the end of lines
nnoremap <silent> <Leader><Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" " Diff
" nnoremap <silent> <expr> <Leader>d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

" " Location list movement
" nmap <Leader>j :lnext<CR>
" nmap <Leader>k :lprev<CR>

" " Source line and selection in vim
" vnoremap <Leader>S y:execute @@<CR>:echo 'Sourced selection.'<CR>
" nnoremap <Leader>S ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>

" " Yank buffer's absolute path to X11 clipboard
" nnoremap <Leader>y :let @+=expand("%:p")<CR>:echo 'Copied to clipboard.'<CR>

" " Drag current line/s vertically and auto-indent
" noremap  <Leader>mk :m-2<CR>==
" noremap  <Leader>mj :m+<CR>==
" vnoremap <Leader>mk :m-2<CR>gv=gv
" vnoremap <Leader>mj :m'>+<CR>gv=gv
"}}}

" Editor UI {{{
" ---------

" " Toggle editor visuals
" nmap <Leader>ts :setlocal spell!<cr>
" nmap <Leader>tn :setlocal nonumber! norelativenumber!<CR>
" nmap <Leader>tl :setlocal nolist!<CR>
" nmap <Leader>th :nohlsearch<CR>
" nmap <Leader>tw :setlocal wrap! breakindent!<CR>

" " Tabs
" nnoremap <silent> g0 :<C-u>tabfirst<CR>
" nnoremap <silent> g$ :<C-u>tablast<CR>
" nnoremap <silent> gr :<C-u>tabprevious<CR>

" }}}

" Basic {
if get(g:, 'vim_better_default_basic_key_mapping', 1)
  " Add <slient> for the rhs is Ex-cmd as some GUI app, e.g., gnvim,
  " flashes when you use these mappings.

  " " Quit normal mode
  " nnoremap <silent> <Leader>q  :q<CR>
  " nnoremap <silent> <Leader>Q  :qa!<CR>

  " " Move half page faster
  " nnoremap <Leader>d  <C-d>
  " nnoremap <Leader>u  <C-u>

  " " Insert mode shortcut
  " inoremap <C-h> <BS>
  " inoremap <C-j> <Down>
  " inoremap <C-k> <Up>
  " inoremap <C-b> <Left>
  " inoremap <C-f> <Right>

  " " Bash like
  " inoremap <C-a> <Home>
  " inoremap <C-e> <End>
  " inoremap <C-d> <Delete>

  " " Command mode shortcut
  " cnoremap <C-h> <BS>
  " cnoremap <C-j> <Down>
  " cnoremap <C-k> <Up>
  " cnoremap <C-b> <Left>
  " cnoremap <C-f> <Right>
  " cnoremap <C-a> <Home>
  " cnoremap <C-e> <End>
  " cnoremap <C-d> <Delete>

  " " jj | escaping
  " inoremap jj <Esc>
  " cnoremap jj <C-c>

  " " Quit visual mode
  " vnoremap v <Esc>

  " " Move to the start of line
  " nnoremap H ^

  " " Move to the end of line
  " nnoremap L $

  " " Redo
  " nnoremap U <C-r>

  " " Quick command mode
  " nnoremap <CR> :

  " " In the quickfix window, <CR> is used to jump to the error under the
  " " cursor, so undefine the mapping there.
  " autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

  " " Yank to the end of line
  " nnoremap Y y$

  " " Auto indent pasted text
  " nnoremap p p=`]<C-o>

  " " Open shell in vim
  " if has('nvim') || has('terminal')
  "   map <silent> <Leader>' :terminal<CR>
  " else
  "   map <silent> <Leader>' :shell<CR>
  " endif

  " " Toggle pastemode
  " nnoremap <silent> <Leader>tp :setlocal paste!<CR>
endif
" }

" Buffer {
if get(g:, 'vim_better_default_buffer_key_mapping', 1)
  " nnoremap <silent> <Leader>bp :bprevious<CR>
  " nnoremap <silent> <Leader>bn :bnext<CR>
  " nnoremap <silent> <Leader>bf :bfirst<CR>
  " nnoremap <silent> <Leader>bl :blast<CR>
  " nnoremap <silent> <Leader>bd :bd<CR>
  " nnoremap <silent> <Leader>bk :bw<CR>
endif
" }

" File {
if get(g:, 'vim_better_default_file_key_mapping', 1)
  " " File save
  " nnoremap <silent> <Leader>fs :update<CR>
endif
" }

" Fold {
if get(g:, 'vim_better_default_fold_key_mapping', 1)
  " nnoremap <silent> <Leader>f0 :set foldlevel=0<CR>
  " nnoremap <silent> <Leader>f1 :set foldlevel=1<CR>
  " nnoremap <silent> <Leader>f2 :set foldlevel=2<CR>
  " nnoremap <silent> <Leader>f3 :set foldlevel=3<CR>
  " nnoremap <silent> <Leader>f4 :set foldlevel=4<CR>
  " nnoremap <silent> <Leader>f5 :set foldlevel=5<CR>
  " nnoremap <silent> <Leader>f6 :set foldlevel=6<CR>
  " nnoremap <silent> <Leader>f7 :set foldlevel=7<CR>
  " nnoremap <silent> <Leader>f8 :set foldlevel=8<CR>
  " nnoremap <silent> <Leader>f9 :set foldlevel=9<CR>
endif
" }

" Window {
if get(g:, 'vim_better_default_window_key_mapping', 1)
  " nnoremap <Leader>ww <C-W>w
  " nnoremap <Leader>wr <C-W>r
  " nnoremap <Leader>wd <C-W>c
  " nnoremap <Leader>wq <C-W>q
  " nnoremap <Leader>wj <C-W>j
  " nnoremap <Leader>wk <C-W>k
  " nnoremap <Leader>wh <C-W>h
  " nnoremap <Leader>wl <C-W>l
  " if has('nvim') || has('terminal')
  "   tnoremap <Leader>wj <C-W>j
  "   tnoremap <Leader>wk <C-W>k
  "   tnoremap <Leader>wh <C-W>h
  "   tnoremap <Leader>wl <C-W>l
  " endif
  " nnoremap <Leader>wH <C-W>5<
  " nnoremap <Leader>wL <C-W>5>
  " nnoremap <Leader>wJ :resize +5<CR>
  " nnoremap <Leader>wK :resize -5<CR>
  " nnoremap <Leader>w= <C-W>=
  " nnoremap <Leader>ws <C-W>s
  " nnoremap <Leader>w- <C-W>s
  " nnoremap <Leader>wv <C-W>v
  " nnoremap <Leader>w\| <C-W>v
  " nnoremap <Leader>w2 <C-W>v
endif
" }

" vim: set ts=2 sw=2 tw=80 et :
