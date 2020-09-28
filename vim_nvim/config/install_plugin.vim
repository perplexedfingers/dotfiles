call dein#add('Shougo/dein.vim')

" theme
call dein#add('rhysd/vim-color-spring-night')
call dein#add('itchyny/lightline.vim')

" edit helper
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})
call dein#add('rstacruz/sparkup', {'on_ft': 'html', 'rtp': 'vim'})
call dein#add('dhruvasagar/vim-table-mode', {
            \'on_cmd': ['TableModeToggle', 'Tableize', 'TableSort']})
call dein#add('tyru/caw.vim', {'on_path': '.*'})
call dein#add('machakann/vim-sandwich', {'on_path': '.*'})

" display enhancement
call dein#add('mhinz/vim-signify', {'on_path': '.*'})
call dein#add('ntpeters/vim-better-whitespace', {'on_path': '.*'})
call dein#add('luochen1990/rainbow', {'on_path': '.*'})
call dein#add('sheerun/vim-polyglot', {'merged': 0, 'depends': ['context_filetype.vim']})
call dein#add('Shougo/context_filetype.vim', {'on_path': '.*'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})
call dein#add('mfukar/robotframework-vim', {'on_ft': ['robot', 'txt', 'rst', 'html']})
call dein#add('alvarolizama/vim-html', {'on_ft': ['django', 'html']})

call dein#add('prabirshrestha/asyncomplete.vim')
call dein#add('prabirshrestha/asyncomplete-buffer.vim', {
           \'depends': 'asyncomplete.vim'})
call dein#add('wellle/tmux-complete.vim',
           \{'depends': 'asyncomplete.vim'})
call dein#add('yami-beta/asyncomplete-omni.vim',
            \{'depends': 'asyncomplete.vim'})
call dein#add('vim-erlang/vim-erlang-omnicomplete'
           \, {'on_ft': 'erlang', 'depends': 'asyncomplete-omni.vim'})
call dein#add('vim-erlang/vim-erlang-compiler'
           \, {'on_ft': 'erlang'})
call dein#add('vim-erlang/erlang-motions.vim'
           \, {'on_ft': 'erlang'})
call dein#add('vim-erlang/vim-erlang-skeletons'
           \, {'on_ft': 'erlang', 'on_cmd': ['ErlServer', 'ErlStatem', 'ErlSupervisor', 'ErlEvent', 'ErlApplication', 'ErlEscript']})

call dein#add('prabirshrestha/async.vim'
           \, {'depends': 'asyncomplete.vim'})
call dein#add('prabirshrestha/vim-lsp'
           \, {'depends': ['asyncomplete.vim', 'async.vim']})
call dein#add('prabirshrestha/asyncomplete-lsp.vim'
           \, {'depends': ['asyncomplete.vim', 'vim-lsp']})
call dein#add('mattn/vim-lsp-settings'
           \, {'on_cmd': ['LspInstallServer', 'LspUninstallServer'], 'depends': 'asyncomplete-lsp.vim', 'merged': 0})

" vim: set ts=2 sw=2 tw=80 et
