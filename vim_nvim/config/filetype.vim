" File Types
"-------------------------------------------------

" Reload vim config automatically {{{
execute 'autocmd MyAutoCmd BufWritePost '.$VIMPATH.'/config/*vim,vimrc nested'
  \ .' source $MYVIMRC | redraw'
" }}}

augroup MyAutoCmd " {{{

  " Automatically set read-only for files being edited elsewhere
  autocmd SwapExists * nested let v:swapchoice = 'o'

  " Reload Vim script automatically if setlocal autoread
  autocmd BufWritePost,FileWritePost *.vim nested
    \ if &l:autoread > 0 | source <afile> |
    \   echo 'source '.bufname('%') |
    \ endif

  " Update filetype on save if empty
  autocmd BufWritePost * nested
    \ if &l:filetype ==# '' || exists('b:ftdetect')
    \ |   unlet! b:ftdetect
    \ |   filetype detect
    \ | endif

  autocmd FileType help
    \ setlocal iskeyword+=: | setlocal iskeyword+=# | setlocal iskeyword+=-

  autocmd FileType crontab setlocal nobackup nowritebackup

  autocmd FileType gitcommit setlocal spell

  autocmd FileType gitcommit,qfreplace setlocal nofoldenable

  autocmd BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

  autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

  autocmd FileType zsh setlocal foldenable foldmethod=marker

  " Improved include pattern
  autocmd FileType html
    \ setlocal includeexpr=substitute(v:fname,'^\\/','','') |
    \ setlocal path+=./;/

  autocmd FileType markdown
    \ setlocal spell expandtab autoindent
      \ formatoptions=tcroqn2 comments=n:>

  autocmd FileType apache setlocal path+=./;/

  autocmd FileType cam setlocal nonumber synmaxcol=10000

  autocmd FileType go highlight default link goErr WarningMsg |
        \ match goErr /\<err\>/

  autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

  autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

augroup END " }}}

" Internal Plugin Settings  {{{
" ------------------------

" PHP {{{
let g:PHP_removeCRwhenUnix = 0

" }}}
" Python {{{
let g:python_highlight_all = 1

" }}}
" Vim {{{
let g:vimsyntax_noerror = 1
"let g:vim_indent_cont = 0

" }}}
" Bash {{{
let g:is_bash = 1

" }}}
" Java {{{
let g:java_highlight_functions = 'style'
let g:java_highlight_all = 1
let g:java_highlight_debug = 1
let g:java_allow_cpp_keywords = 1
let g:java_space_errors = 1
let g:java_highlight_functions = 1

" }}}
" JavaScript {{{
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" }}}
" Markdown {{{
let g:markdown_fenced_languages = [
  \  'css',
  \  'javascript',
  \  'js=javascript',
  \  'json=javascript',
  \  'python',
  \  'py=python',
  \  'sh',
  \  'sass',
  \  'xml',
  \  'vim'
  \]

" }}}
" Folding {{{
" augroup: a
" function: f
let g:vimsyn_folding = 'af'
let g:tex_fold_enabled = 1
let g:xml_syntax_folding = 1
let g:php_folding = 2
let g:php_phpdoc_folding = 1
let g:perl_fold = 1
" }}}
" }}}
" vim: set ts=2 sw=2 tw=80 et :
