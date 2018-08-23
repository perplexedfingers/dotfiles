scriptencoding utf-8

if dein#tap('committia.vim')
  let g:committia_min_window_width = 70
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

if dein#tap('asyncomplete.vim')
  let g:asyncomplete_remove_duplicates = 1
  let g:asyncomplete_smart_completion = 1
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif  " auto close
endif

if dein#tap('tmux-complete.vim')
  let g:tmuxcomplete#asyncomplete_source_options = {
            \ 'name':      'tmux',
            \ 'whitelist': ['*'],
            \ 'config': {
            \     'splitmode':      'words',
            \     'filter_prefix':   1,
            \     'show_incomplete': 1,
            \     'sort_candidates': 0,
            \     'scrollback':      0,
            \     'truncate':        0
            \     }
            \ }
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
	autocmd FileType robot let b:caw_oneline_comment = '#'
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
" vim: set ts=2 sw=2 tw=80 et :
