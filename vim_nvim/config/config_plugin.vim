scriptencoding utf-8

if dein#tap('asyncomplete.vim')
  " removing duplicates
  function! s:my_asyncomplete_preprocessor(options, matches) abort
    let l:visited = {}
    let l:items = []
    for [l:source_name, l:matches] in items(a:matches)
      for l:item in l:matches['items']
        if stridx(l:item['word'], a:options['base']) == 0
          if !has_key(l:visited, l:item['word'])
            call add(l:items, l:item)
            let l:visited[l:item['word']] = 1
          endif
        endif
      endfor
    endfor

    call asyncomplete#preprocess_complete(a:options, l:items)
  endfunction
  let g:asyncomplete_preprocessor = [function('s:my_asyncomplete_preprocessor')]

  " Use traditional C-n/C-p to show autocomplete rather showing while typing
  let g:asyncomplete_auto_popup = 0
  function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
  inoremap <silent><expr> <C-n>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ asyncomplete#force_refresh()
  inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-h>"
endif

if dein#tap('asyncomplete-omni.vim')
  autocmd User asyncomplete_setup call asyncomplete#register_source(
        \asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'allowlist': ['*'],
        \ 'blocklist': ['c', 'cpp', 'html'],
        \ 'completor': function('asyncomplete#sources#omni#completor'),
        \ 'config': {
        \   'show_source_kind': 1,
        \ },
        \ }))
endif

if dein#tap('asyncomplete-buffer.vim')
  autocmd User asyncomplete_setup call asyncomplete#register_source(
        \asyncomplete#sources#buffer#get_source_options({
        \ 'name': 'buffer',
        \ 'allowlist': ['*'],
        \ 'blocklist': ['go'],
        \ 'completor': function('asyncomplete#sources#buffer#completor'),
        \ 'config': {
        \    'max_buffer_size': 5000000,
        \  },
        \ }))
endif

if dein#tap('vim-better-whitespace')
  nnoremap <silent> <Leader><Space> :StripWhitespace<CR>
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

if dein#tap('asyncomplete-tags.vim')
  autocmd User asyncomplete_setup call asyncomplete#register_source(
        \asyncomplete#sources#tags#get_source_options({
        \ 'name': 'tags',
        \ 'allowlist': ['c', 'python'],
        \ 'completor': function('asyncomplete#sources#tags#completor'),
        \ 'config': {
        \    'max_file_size': 50000000,
        \  },
        \ }))
  " 50 MB for the tag file
endif

if dein#tap('vim-lsp')
  if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
  endif

  " Only work for node RPC
  " if dein#tap('vim-rescript')
  "   au User lsp_setup call lsp#register_server({
  "      \ 'name': 'rescript-language-server',
  "      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'node ~/.cache/vim/dein/repos/github.com/rescript-lang/vim-rescript/server/out/server.js --stdio']},
  "      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'bsconfig.json'))},
  "      \ 'whitelist': ['rescript'],
  "      \ })
  " endif

  if executable('erlang_ls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'erlang_ls',
        \ 'cmd': {server_info->['erlang_ls']},
        \ 'whitelist': ['erlang'],
        \ })
  endif

  let g:lsp_diagnostics_echo_cursor = 1
  set foldmethod=expr
      \ foldexpr=lsp#ui#vim#folding#foldexpr()
      \ foldtext=lsp#ui#vim#folding#foldtext()

  function! s:on_lsp_buffer_enabled() abort
      setlocal omnifunc=lsp#complete
      setlocal signcolumn=yes
      if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
      " refer to doc to add more commands
  endfunction

  augroup lsp_install
      au!
      " call s:on_lsp_buffer_enabled only for languages that has the server registered.
      autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END
endif

if dein#tap('signify')
  let g:signify_vcs_list = ['git', 'hg', 'fossil']
  let g:signify_cursorhold_insert = 1
  let g:signify_cursorhold_normal = 1
  let g:signify_update_on_bufenter = 0
  let g:signify_update_on_focusgained = 1
endif

if dein#tap('caw.vim')
  let g:caw_hatpos_skip_blank_line = 1
  let g:caw_dollarpos_skip_blank_line = 1
  autocmd FileType robots let b:caw_oneline_comment = '#'
endif

if dein#tap('vim-sandwitch')
  let g:sandwich#recipes += [
      \   {
      \     'external': ['it', 'at'],
      \     'noremap' : 1,
      \     'filetype': ['html'],
      \     'input'   : ['t'],
      \   },
      \ ]
endif

if dein#tap('vim-table-mode')
  autocmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
  autocmd BufEnter *.rst let g:table_mode_corner_corner="+"
        \ | let g:table_mode_header_fillchar="="
  autocmd BufLeave *.rst unlet g:table_mode_header_fillchar
endif

if dein#tap('zazen')
  colorscheme zazen
endif

if dein#tap('vim-gutentags')
  let g:gutentags_ctags_executable = '/usr/local/bin/ctags'
  let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
  command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

  let g:gutentags_generate_on_new = 1
  let g:gutentags_generate_on_missing = 1
  let g:gutentags_generate_on_write = 1
  let g:gutentags_generate_on_empty_buffer = 0
  let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
  let g:gutentags_file_list_command = {
        \ 'markers': {
        \   '.git': 'git ls-files',
        \   '.hg': 'hg files',
        \   },
        \ }
  let g:gutentags_ctags_exclude = [
        \ '*.git', '*.svg', '*.hg',
        \ '*/tests/*',
        \ 'build',
        \ 'dist',
        \ '*sites/*/files/*',
        \ 'bin',
        \ 'node_modules',
        \ 'bower_components',
        \ 'cache',
        \ 'compiled',
        \ 'docs',
        \ 'example',
        \ 'bundle',
        \ 'vendor',
        \ '*.md',
        \ '*-lock.json',
        \ '*.lock',
        \ '*bundle*.js',
        \ '*build*.js',
        \ '.*rc*',
        \ '*.json',
        \ '*.min.*',
        \ '*.map',
        \ '*.bak',
        \ '*.zip',
        \ '*.pyc',
        \ '*.class',
        \ '*.sln',
        \ '*.Master',
        \ '*.csproj',
        \ '*.tmp',
        \ '*.csproj.user',
        \ '*.cache',
        \ '*.pdb',
        \ 'tags*',
        \ 'cscope.*',
        \ '*.css',
        \ '*.less',
        \ '*.scss',
        \ '*.exe', '*.dll',
        \ '*.mp3', '*.ogg', '*.flac',
        \ '*.swp', '*.swo',
        \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
        \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
        \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
        \ ]
endif
" vim: set ts=2 sw=2 tw=80 et :
