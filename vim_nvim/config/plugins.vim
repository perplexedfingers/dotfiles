" Plugins
" --------------------------------------------------------

" Loaded on startup {{{
" ---
call dein#add('Shougo/dein.vim')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('itchyny/lightline.vim', {
  \'hook_add': 'source '.$VIMPATH.'/config/plugins/lightline.vim'})

" Commands {{{
" --------
call dein#add('dhruvasagar/vim-table-mode', {
  \'on_cmd': ['TableModeToggle', 'Tableize', 'TableSort']})
call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})
call dein#add('benekastah/neomake', {'on_cmd': 'Neomake',
  \'hook_add': 'source'.$VIMPATH.'/config/plugins/neomake.vim'})

" }}}

" Shorcuts {{{
" --------
call dein#add('tyru/caw.vim', {'on_path': '.*'})
call dein#add('machakann/vim-sandwich', {'on_path': '.*'})
call dein#add('justinmk/vim-sneak', {'on_map': {'oxn': '<Plug>Sneak'}})
call dein#add('rstacruz/sparkup', {'on_ft': 'html', 'rtp': 'vim'})

" }}}

" Interface {{{
" ---------
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})
call dein#add('jsfaint/gen_tags.vim', {
  \'on_cmd': ['GenCtags', 'ClearCtags', 'GenGTAGS', 'ClearGTAGS']})
call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle', 'depends': 'gen_tags.vim'})
call dein#add('mhinz/vim-signify', {'on_path': '.*'})
call dein#add('ntpeters/vim-better-whitespace', {'on_path': '.*'})
call dein#add('luochen1990/rainbow', {'on_path': '.*'})
call dein#add('itchyny/vim-cursorword', {'on_path': '.*'})
call dein#add('sheerun/vim-polyglot', {'on_path': '.*', 'on_source': 'context_filetype.vim'})
call dein#add('Shougo/context_filetype.vim', {'on_path': '.*'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})
call dein#add('mfukar/robotframework-vim', {'on_ft': ['robot', 'txt', 'rst', 'html']})

" }}}

" Completion {{{
" ----------
call dein#add('prabirshrestha/asyncomplete.vim', {'on_path': '.*'})
call dein#add('prabirshrestha/async.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim'})
call dein#add('prabirshrestha/vim-lsp', {'on_path': '.*', 'depends': ['asyncomplete.vim', 'async.vim']})
call dein#add('ryanolsonx/vim-lsp-python', {'on_path': '.*', 'depends': ['vim-lsp', 'async.vim']})
call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'on_path': '.*', 'depends': ['asyncomplete.vim', 'vim-lsp']})
call dein#add('yami-beta/asyncomplete-omni.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim'})
call dein#add('prabirshrestha/asyncomplete-buffer.vim', {'on_path': '.*', 'depends': 'asyncomplete.vim'})
call dein#add('prabirshrestha/asyncomplete-tags.vim', {'on_path': '.*', 'depends': ['gen_tags.vim', 'asyncomplete.vim']})

call dein#add('vim-erlang/vim-erlang-tags', {'on_ft': 'erlang', 'depends': 'asyncomplete-tags.vim'})
call dein#add('vim-erlang/vim-erlang-omnicomplete', {'on_ft': 'erlang', 'depends': 'asyncomplete-omni.vim'})

" }}}

" vim: set ts=2 sw=2 tw=80 et
