scriptencoding utf-8

if dein#tap('lightline.vim')
  let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly?"x":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \  },
    \ 'component_function': {
    \   'modified': 'LightLineModified',
    \   'readonly': 'LightLineReadonly',
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename',
    \   'fileformat': 'LightLineFileformat',
    \   'filetype': 'LightLineFiletype',
    \   'fileencoding': 'LightLineFileencoding',
    \   'mode': 'LightLineMode',
    \ },
    \ 'separator': { 'left': '|', 'right': '|' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ }

  function! LightLineModified()
      return &filetype =~? 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! LightLineReadonly()
      return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
  endfunction

  function! LightLineFilename()
      return ('' !=? LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
      \ (&filetype ==? 'vimfiler' ? vimfiler#get_status_string() :
      \  &filetype ==? 'unite' ? unite#get_status_string() :
      \  &filetype ==? 'vimshell' ? vimshell#get_status_string() :
      \ '' !=? expand('%:t') ? expand('%:t') : '[No Name]') .
      \ ('' !=? LightLineModified() ? ' ' . LightLineModified() : '')
  endfunction

  function! LightLineFugitive()
      if &filetype !~? 'vimfiler\|gundo' && exists('*fugitigveg#head')
          let l:branch = fugitive#head()
          return l:branch !=# '' ? '⭠ '.l:branch : ''
      endif
      return ''
  endfunction

  function! LightLineFileformat()
      return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! LightLineFiletype()
      return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  endfunction

  function! LightLineFileencoding()
      return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
  endfunction

  function! LightLineMode()
      return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction
endif

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

if dein#tap('papercolor-theme')
  let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     }
  \ }
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

if dein#tap('neomake')
  let g:neomake_python_python3_maker = {
        \ 'errorformat': '%E%f:%l:%c: %m',
        \ 'serialize': 1,
        \ 'serialize_abort_on_error': 1,
        \ 'output_stream': 'stdout',
        \ }

  let g:neomake_python_prospector_maker = {
              \ 'args': ['--no-autodetect', '--output-format', 'pylint', '--doc-warnings', '--member-warnings', '--full-pep8', '--max-line-length', '120'],
              \ 'errorformat': '%f:%l: %m'
              \ }

  let g:neomake_open_list = 1

  let g:neomake_verbose = 1
  let g:neomake_serialize = 1
  let g:neomake_serialize_abort_on_error = 1

  let g:neomake_error_sign = {'text': '✖', 'texthl': 'ErrorMsg'}
  let g:neomake_warning_sign = {'text': '◆', 'texthl': 'WarningMsg'}
  let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
  let g:neomake_info_sign = {'text': '§', 'texthl': 'NeomakeInfoSign'}
endif

if dein#tap('neoformat')
  let g:neoformat_run_all_formatters = 1
  let g:neoformat_try_formatprg = 1
  let g:neoformat_basic_format_align = 1
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1

  let g:neoformat_python_autopep8 ={
        \'exe': 'autopep8',
        \'args': ['-', '--max-line-length 120'],
        \'stdin': 1
        \}
  let g:neoformat_python_isort = {
        \'exe': 'isort',
        \'stdin': 1,
        \'args': ['-',
        \         '--combine-star',
        \         '--combine-as',
        \         '--order-by-type',
        \         '--multi-line 0',
        \         '--balanced',
        \         '--quiet']
        \}
  let g:neoformat_enabled_python = ['autopep8', 'isort']
endif

if dein#tap('vim-table-mode')
  autocmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
  autocmd BufEnter *.rst let g:table_mode_corner_corner="+"
    \ | let g:table_mode_header_fillchar="="
  autocmd BufLeave *.rst unlet g:table_mode_header_fillchar
endif

if dein#tap('vim-slumlord')
  let g:slumlord_plantuml_jar_path = '/home/ray/Downloads/plantuml.1.2019.9.jar'
endif
" vim: set ts=2 sw=2 tw=80 et :