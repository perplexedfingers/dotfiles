call dein#add('Shougo/dein.vim')

" theme
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('itchyny/lightline.vim', {
  \'hook_add': 'source '.$VIMPATH.'/config/plugins/lightline.vim'})

" code edit helper
call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})
call dein#add('benekastah/neomake', {'on_cmd': 'Neomake',
  \'hook_add': 'source'.$VIMPATH.'/config/plugins/neomake.vim'})
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})
call dein#add('rstacruz/sparkup', {'on_ft': 'html', 'rtp': 'vim'})

" edit shortcut
call dein#add('dhruvasagar/vim-table-mode', {
  \'on_cmd': ['TableModeToggle', 'Tableize', 'TableSort']})
call dein#add('tyru/caw.vim', {'on_path': '.*'})
call dein#add('machakann/vim-sandwich', {'on_path': '.*'})
call dein#add('justinmk/vim-sneak', {'on_map': {'oxn': '<Plug>Sneak'}})

" display enhancement
call dein#add('mhinz/vim-signify', {'on_path': '.*'})
call dein#add('ntpeters/vim-better-whitespace', {'on_path': '.*'})
call dein#add('luochen1990/rainbow', {'on_path': '.*'})
call dein#add('itchyny/vim-cursorword', {'on_path': '.*'})
call dein#add('sheerun/vim-polyglot', {'on_path': '.*', 'on_source': 'context_filetype.vim'})
call dein#add('Shougo/context_filetype.vim', {'on_path': '.*'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})
call dein#add('mfukar/robotframework-vim', {'on_ft': ['robot', 'txt', 'rst', 'html']})

" completion
function! s:for_buffer() abort
  call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))
endfunction

function! s:for_omni() abort
  call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['c', 'cpp', 'html'],
    \ 'completor': function('asyncomplete#sources#omni#completor')
    \  }))
endfunction

call dein#add('prabirshrestha/asyncomplete.vim', {'on_path': '.*'})
call dein#add('prabirshrestha/asyncomplete-buffer.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim', 'hook_post_source': function('s:for_buffer')})
call dein#add('wellle/tmux-complete.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim'})
call dein#add('yami-beta/asyncomplete-omni.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim', 'hook_post_source': function('s:for_omni')})
call dein#add('vim-erlang/vim-erlang-omnicomplete', {'on_ft': 'erlang', 'depends': 'asyncomplete-omni.vim'})

call dein#add('prabirshrestha/async.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim'})
call dein#add('prabirshrestha/vim-lsp', {'on_path': '.*', 'depends': ['asyncomplete.vim', 'async.vim']})
call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'on_path': '.*', 'depends': ['asyncomplete.vim', 'vim-lsp']})
call dein#add('ryanolsonx/vim-lsp-python', {'on_ft': 'python', 'depends': 'asyncomplete-lsp.vim'})

" vim: set ts=2 sw=2 tw=80 et
