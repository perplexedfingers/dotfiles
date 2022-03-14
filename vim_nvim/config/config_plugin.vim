scriptencoding utf-8

if dein#tap('asyncomplete.vim')
  function! Asyncomplete() abort
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
  endfunction

  call dein#set_hook('asyncomplete.vim', 'hook_source', function('Asyncomplete'))
endif

if dein#tap('asyncomplete-omni.vim')
  function! Asyncomplete_omni() abort
    autocmd User asyncomplete_setup call asyncomplete#register_source(
          \{
          \ 'name': 'omni',
          \ 'allowlist': ['*'],
          \ 'blocklist': ['c', 'cpp', 'html'],
          \ 'completor': function('asyncomplete#sources#omni#completor'),
          \ 'config': {
          \   'show_source_kind': 1,
          \ },
          \ })
  endfunction

  call dein#set_hook('asyncomplete-omni.vim', 'hook_source', function('Asyncomplete_omni'))
endif

if dein#tap('asyncomplete-buffer.vim')
  function! Asyncomplete_buffer() abort
    autocmd User asyncomplete_setup call asyncomplete#register_source(
          \{
          \ 'name': 'buffer',
          \ 'allowlist': ['*'],
          \ 'blocklist': ['go'],
          \ 'completor': function('asyncomplete#sources#buffer#completor'),
          \ 'config': {
          \    'max_buffer_size': 5000000,
          \  },
          \ })
  endfunction

  call dein#set_hook('asyncomplete-buffer.vim', 'hook_source', function('Asyncomplete_buffer'))
endif

if dein#tap('tmux-complete.vim')
  function! Tmux_complete() abort
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
  endfunction

  call dein#set_hook('tmux-complete.vim', 'hook_source', function('Tmux_complete'))
endif

if dein#tap('asyncomplete-tags.vim')
  function! Asyncomplete_tags() abort
    autocmd User asyncomplete_setup call asyncomplete#register_source(
          \{
          \ 'name': 'tags',
          \ 'allowlist': ['*'],
          \ 'completor': function('asyncomplete#sources#tags#completor'),
          \ 'config': {
          \    'max_file_size': 50000000,
          \  },
          \ })
    " 50 MB for the tag file
  endfunction

  call dein#set_hook('asyncomplete-tags.vim', 'hook_source', function('Asyncomplete_tags'))
endif

if dein#tap('vim-lsp')
  function! Vim_lsp() abort
    if executable('pipx') && executable('pylsp')
      if executable('poetry')
        au User lsp_setup call lsp#register_server({
           \ 'name': 'pylsp with poetry project',
           \ 'cmd': { server_info->[&shell, &shellcmdflag, 'pylsp']},
           \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'pyproject.toml'))},
           \ 'allowlist': ['python'],
           \ })
      end
      if executable('pipenv')
        au User lsp_setup call lsp#register_server({
           \ 'name': 'pylsp with pipenv project',
           \ 'cmd': { server_info->[&shell, &shellcmdflag, 'pylsp']},
           \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Pipfile'))},
           \ 'allowlist': ['python'],
           \ })
      end
    end

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
          \ 'allowlist': ['erlang'],
          \ })
    endif

    let g:lsp_format_sync_timeout = 1000
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_diagnostics_highlights_enabled = 0
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_diagnostics_signs_priority_map = {
          \'LspError': 11,
          \'LspWarning': 7,
          \}
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
  endfunction

  call dein#set_hook('vim-lsp', 'hook_source', function('Vim_lsp'))
endif

if dein#tap('vim-better-whitespace')
  call dein#set_hook('asyncomplete-buffer.vim', 'hook_source',
        \'nnoremap <silent> <Leader><Space> :StripWhitespace<CR>')
endif

if dein#tap('signify')
  function! Signify() abort
    let g:signify_vcs_list = ['git', 'hg', 'fossil']
    let g:signify_cursorhold_insert = 1
    let g:signify_cursorhold_normal = 1
    let g:signify_update_on_bufenter = 1
    let g:signify_update_on_focusgained = 1
  endfunction

  call dein#set_hook('signify', 'hook_source', function('Signify'))
endif

if dein#tap('caw.vim')
  function! Caw() abort
    let g:caw_hatpos_skip_blank_line = 1
    let g:caw_dollarpos_skip_blank_line = 1
    autocmd FileType robots let b:caw_oneline_comment = '#'
  endfunction

  call dein#set_hook('caw.vim', 'hook_source', function('Caw'))
endif

if dein#tap('vim-sandwich')
  function! Vim_sandwich() abort
    nmap s <Nop>
    xmap s <Nop>
    let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
    let g:sandwich#recipes += [
        \   {
        \     'external': ['it', 'at'],
        \     'noremap' : 1,
        \     'filetype': ['html'],
        \     'input'   : ['t'],
        \   },
        \ ]
  endfunction

  call dein#set_hook('vim-sandwich', 'hook_source', function('Vim_sandwich'))
endif

if dein#tap('vim-table-mode')
  function! Vim_table_mode() abort
    autocmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
    autocmd BufEnter *.rst let g:table_mode_corner_corner="+"
          \ | let g:table_mode_header_fillchar="="
    autocmd BufLeave *.rst unlet g:table_mode_header_fillchar
  endfunction

  call dein#set_hook('vim-table-mode', 'hook_source', function('Vim_table_mode'))
endif

if dein#tap('zazen')
  call dein#set_hook('zazen', 'hook_source', 'colorscheme zazen')
endif

if dein#tap('goyo.vim')
  function! Goyo() abort
    let g:goyo_linenr = 1

    function! s:goyo_enter()
      if exists('$TMUX')
        silent !tmux set status off
      endif
    endfunction

    function! s:goyo_leave()
      if exists('$TMUX')
        silent !tmux set status on
      endif
    endfunction

    autocmd! User GoyoEnter call <SID>goyo_enter()
    autocmd! User GoyoLeave call <SID>goyo_leave()
  endfunction

  call dein#set_hook('goyo.vim', 'hook_source', function('Goyo'))
endif

if dein#tap('vim-gutentags')
  function! Vim_gutentags() abort
    let g:gutentags_ctags_executable = 'uctags'
    let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
    command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

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
  endfunction

  call dein#set_hook('vim-gutentags', 'hook_source', function('Vim_gutentags'))
endif

" vim: set ts=2 sw=2 tw=80 et :
