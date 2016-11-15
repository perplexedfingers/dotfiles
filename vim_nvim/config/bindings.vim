" Fix keybind name for Ctrl+Spacebar
map <Nul> <C-Space>
map! <Nul> <C-Space>

"}}}
" Global niceties {{{
" ---------------
" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" Disable EX-mode
nnoremap  Q <Nop>
nnoremap gQ <Nop>

" Navigation in command line
cnoremap <C-j> <Left>
cnoremap <C-k> <Right>
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <C-w>

" }}}
" File operations {{{
" ---------------

" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :cd %:p:h<CR>:pwd<CR>

" }}}
" Editor UI {{{
" ---------

" Toggle paste mode
set pastetoggle=<F2>

" Toggle editor visuals
nmap <Leader>ts :setlocal spell!<cr>
nmap <Leader>tn :setlocal nonumber! norelativenumber!<CR>
nmap <Leader>tl :setlocal nolist!<CR>
nmap <Leader>th :nohlsearch<CR>
nmap <Leader>tw :setlocal wrap! breakindent!<CR>

" Tabs
nnoremap <silent> g0 :<C-u>tabfirst<CR>
nnoremap <silent> g$ :<C-u>tablast<CR>
nnoremap <silent> gr :<C-u>tabprevious<CR>

" }}}
" Totally Custom {{{
" --------------

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" Diff
nnoremap <silent> <expr> ,d ":\<C-u>".(&diff?"diffoff":"diffthis")."\<CR>"

" C-r: Easier search and replace
xnoremap <C-r> :<C-u>call VSetSearch('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>

" Location list movement
nmap <Leader>j :lnext<CR>
nmap <Leader>k :lprev<CR>

" Source line and selection in vim
vnoremap <Leader>S y:execute @@<CR>:echo 'Sourced selection.'<CR>
nnoremap <Leader>S ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>

" Append modeline to EOF
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Yank buffer's absolute path to X11 clipboard
nnoremap <Leader>y :let @+=expand("%:p")<CR>:echo 'Copied to clipboard.'<CR>

" Drag current line/s vertically and auto-indent
noremap  <Leader>mk :m-2<CR>==
noremap  <Leader>mj :m+<CR>==
vnoremap <Leader>mk :m-2<CR>gv=gv
vnoremap <Leader>mj :m'>+<CR>gv=gv

nnoremap <Leader>se :<C-u>SessionSave last<CR>
nnoremap <Leader>os :<C-u>execute 'source '.g:session_directory.'/last.vim'<CR>

augroup MyAutoCmd " {{{

  if has('mac')
    " Use Marked for real-time Markdown preview
    autocmd FileType markdown
      \ nnoremap <Leader>P :silent !open -a Marked\ 2.app '%:p'<CR>:redraw!<CR>
    " Use Dash on Mac, for context help
    autocmd FileType ansible,go,php,css,less,html,markdown
      \ nnoremap <silent><buffer> K :!open -g dash://"<C-R>=split(&ft, '\.')[0]<CR>:<cword>"&<CR><CR>
    autocmd FileType javascript,javascript.jsx,sql,ruby,conf,sh
      \ nnoremap <silent><buffer> K :!open -g dash://"<cword>"&<CR><CR>
  else
    " Use Zeal on Linux for context help
    autocmd FileType ansible,go,php,css,less,html,markdown
      \ nnoremap <silent><buffer> K :!zeal --query "<C-R>=split(&ft, '\.')[0]<CR>:<cword>"&<CR><CR>
    autocmd FileType javascript,javascript.jsx,sql,ruby,conf,sh
      \ nnoremap <silent><buffer> K :!zeal --query "<cword>"&<CR><CR>
  endif

augroup END
" }}}
" vim: set ts=2 sw=2 tw=80 et :
