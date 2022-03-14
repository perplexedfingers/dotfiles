call dein#add('Shougo/dein.vim')
" theme
call dein#add('zaki/zazen')

" autocomplete
call dein#add('prabirshrestha/asyncomplete.vim', {'on_path': '.*'})

" autocomplete source
call dein#add('prabirshrestha/asyncomplete-buffer.vim', {'on_source': 'asyncomplete.vim'})
call dein#add('prabirshrestha/asyncomplete-tags.vim', {'on_source': ['asyncomplete.vim', 'vim-gutentags']})
call dein#add('prabirshrestha/vim-lsp', {'on_source': 'asyncomplete.vim'})
call dein#add('yami-beta/asyncomplete-omni.vim', {'on_source': 'asyncomplete.vim'})
call dein#add('prabirshrestha/async.vim', {'on_source': 'asyncomplete.vim'})
call dein#add('wellle/tmux-complete.vim', {'on_source': 'async.vim'})

" LSP
call dein#add('prabirshrestha/asyncomplete-lsp.vim', {'on_source': 'vim-lsp'})
call dein#add('machakann/vim-lsp-julia', {'on_ft': 'julia', 'on_source': 'asyncomplete-lsp.vim'})

" Erlang related autocomplete
call dein#add('vim-erlang/vim-erlang-omnicomplete', {'on_ft': 'erlang', 'on_source': 'asyncomplete-omni.vim'})
call dein#add('vim-erlang/erlang-motions.vim', {'on_ft': 'erlang'})
call dein#add('vim-erlang/vim-erlang-skeletons'
           \, {'on_ft': 'erlang',
           \ 'on_cmd': ['ErlServer', 'ErlStatem', 'ErlSupervisor', 'ErlEvent', 'ErlApplication', 'ErlEscript']})

" edit helper
call dein#add('rstacruz/sparkup', {'on_ft': 'html', 'rtp': 'vim'})
call dein#add('dhruvasagar/vim-table-mode', {'on_cmd': 'TableModeToggle'})
call dein#add('junegunn/goyo.vim', {'on_cmd': 'Goyo'})
call dein#add('petobens/poet-v', {'on_cmd': 'PoetvActivate'})

call dein#add('tyru/caw.vim', {'on_path': '.*'})
call dein#add('machakann/vim-sandwich', {'on_path': '.*'})
call dein#add('ludovicchabant/vim-gutentags', {'on_path': '.*'})

" display enhancement
call dein#add('mhinz/vim-signify', {'on_path': '.*'})
call dein#add('ntpeters/vim-better-whitespace', {'on_path': '.*'})
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})

" filetype
call dein#add('sheerun/vim-polyglot', {'merged': 0, 'merge_ftdetect': v:true})
call dein#add('Shougo/context_filetype.vim', {'on_source': 'vim-polyglot'})
call dein#add('vim-scripts/django.vim', {'on_ft': ['django', 'htmldjango']})
call dein#add('rescript-lang/vim-rescript', {'on_path': ['.res', '.resi'], 'merge_ftdetect': v:true})
call dein#add('rhysd/committia.vim', {'on_path': ['COMMIT_EDITMSG', 'MERGE_MSG']})
call dein#add('perplexedfingers/robotframework-vim', {'on_path': ['.robot', '.resource', '.txt', '.rst', '.html'], 'merge_ftdetect': v:true})

" vim: set ts=2 sw=2 tw=80 et
