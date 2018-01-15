scriptencoding utf-8
" Plugin Settings
"---------------------------------------------------------
if dein#tap('committia.vim')
  let g:committia_min_window_width = 70
endif

if dein#tap('tagbar')
  map <F7> :TagbarToggle<CR>
  let g:tagbar_iconchars = ['+', '-']
endif

if dein#tap('vim-sneak')
  " s is conflicted with sandwich
  map f <Plug>Sneak_s
  map F <Plug>Sneak_S
endif

if dein#tap('rainbow')
  let g:rainbow_active = 1
  let g:rainbow_conf = {
        \'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \	'ctermfgs': ['lightblue', 'lightyellow',
        \              'lightcyan', 'lightmagenta'],
        \	'operators': '_,\|+\|-\|*\|\/\|===\|!==_',
        \	'parentheses': ['start=/(/ end=/)/ fold',
        \                 'start=/\[/ end=/\]/ fold',
        \                 'start=/{/ end=/}/ fold'],
        \	'separately': {
        \		'javascript': {
        \			'parentheses': ['start=/(/ end=/)/',
        \                     'start=/\[/ end=/\]/',
        \                     'start=/{/ end=/}/'],
        \   },
        \		'vim': {
        \			'parentheses': ['start=/(/ end=/)/',
        \                     'start=/\[/ end=/\]/',
        \                     'start=/{/ end=/}/ fold',
        \                     'start=/(/ end=/)/ containedin=vimFuncBody',
        \                     'start=/\[/ end=/\]/ containedin=vimFuncBody',
        \                     'start=/{/ end=/}/ fold containedin=vimFuncBody'],
        \		},
        \		'html': {
        \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
        \		},
        \		'css': 0,
        \	}
        \}
endif

if dein#tap('prabirshrestha/asyncomplete.vim')
  let g:asyncomplete_auto_popup = 0

  function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ asyncomplete#force_refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  let g:asyncomplete_remove_duplicates = 1

  set completeopt+=preview
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
endif

if dein#tap('prabirshrestha/asyncomplete-tags.vim')
  call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \    'max_file_size': 50000000,
    \  },
    \ }))
endif

if dein#tap('prabirshrestha/asyncomplete-omni.vim')
  call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['html'],
    \ 'completor': function('asyncomplete#sources#omni#completor')
    \  }))
endif

if dein#tap('prabirshrestha/asyncomplete-buffer.vim')
  call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor')
    \  }))
endif

if dein#tap('jedi-vim')
  let g:jedi#force_py_version = 3
endif

if dein#tap('signify')
  let g:signify_vcs_list = ['git', 'hg']
  let g:signify_cursorhold_insert = 1
  let g:signify_cursorhold_normal = 1
  let g:signify_update_on_bufenter = 0
  let g:signify_update_on_focusgained = 1
endif

if dein#tap('caw.vim')
	let g:caw_hatpos_skip_blank_line = 1
	let g:caw_dollarpos_skip_blank_line = 1
endif

if dein#tap('gen_tags.vim')
  autocmd BufReadPost,FileReadPost,StdinReadPost *.py execute ":GenCtags"
  autocmd VimLeavePre *.py execute ":ClearCtags!"
  " Gtags supports only c, cpp and some (v6.5.3)
  autocmd BufReadPost,FileReadPost,StdinReadPost *.c{,pp} execute ":GenGTAGS"
  autocmd VimLeavePre *.c{,pp} execute ":ClearGTAGS!"
endif

if dein#tap('neoformat')
  let g:neoformat_enabled_python = ['autopep8', 'isort']

  " let g:neoformat_python_isort = {
  "       \'exe': 'isort',
  "       \'stdin': 1,
  "       \'args': ['-',
  "       \         '--combine-star',
  "       \         '--combine-as',
  "       \         '--order-by-type',
  "       \         '--multi_line 0',
  "       \         '--balanced',
  "       \         '--quiet']
  "       \}

  let g:neoformat_try_formatprg = 1
  let g:neoformat_basic_format_align = 1
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1
endif

if dein#tap('vim-table-mode')
  autocmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
  autocmd BufEnter *.rst let g:table_mode_corner_corner="+"
    \ | let g:table_mode_header_fillchar="="
  autocmd BufLeave *.rst unlet g:table_mode_header_fillchar
endif

if dein#tap('papercolor-theme')
  let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     }
  \ }
  \}
endif
" vim: set ts=2 sw=2 tw=80 et :
