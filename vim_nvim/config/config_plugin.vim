scriptencoding utf-8

" asyncomplete.vim
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

call Asyncomplete()

" asyncomplete-omni.vim
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

call Asyncomplete_omni()

" asyncomplete-buffer.vim
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

call Asyncomplete_buffer()

" tmux-complete.vim
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

call Tmux_complete()

" vim-lsp
function! Vim_lsp() abort
  if executable('pipx') && executable('pylsp')
    au User lsp_setup call lsp#register_server({
       \ 'name': 'pylsp',
       \ 'cmd': { server_info->[&shell, &shellcmdflag, 'pylsp']},
       \ 'root_uri':{server_info->lsp#utils#path_to_uri(
       \   lsp#utils#find_nearest_parent_file_directory(
       \     lsp#utils#get_buffer_path(),
       \     ['pyproject.toml', 'Pipfile', 'requirements.txt', 'setup.py']))},
       \ 'allowlist': ['python'],
       \ })
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
        \'LspError': 12,
        \'LspWarning': 11,
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

call Vim_lsp()

" vim-better-whitespace
nnoremap <silent> <Leader><Space> :StripWhitespace<CR>

" signify
function! Signify() abort
  let g:signify_vcs_list = ['git', 'hg', 'fossil']
  let g:signify_cursorhold_insert = 1
  let g:signify_cursorhold_normal = 1
  let g:signify_update_on_bufenter = 1
  let g:signify_update_on_focusgained = 1
endfunction

call Signify()

" caw.vim
function! Caw() abort
  let g:caw_hatpos_skip_blank_line = 1
  let g:caw_dollarpos_skip_blank_line = 1
  autocmd FileType robots let b:caw_oneline_comment = '#'
endfunction

call Caw()

" vim-sandwich
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

call Vim_sandwich()

" vim-table-mode
function! Vim_table_mode() abort
  autocmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
  autocmd BufEnter *.rst let g:table_mode_corner_corner="+"
        \ | let g:table_mode_header_fillchar="="
  autocmd BufLeave *.rst unlet g:table_mode_header_fillchar
endfunction

call Vim_table_mode()

" zazen
colorscheme zazen

" goyo
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

call Goyo()

" vimspector
function! Vimspector() abort
  let g:vimspector_enable_mappings = 'HUMAN'
endfunction

call Vimspector()

" vim: set ts=2 sw=2 tw=80 et :
