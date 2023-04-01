Plug 'zaki/zazen'

" autocomplete
Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-buffer.vim'
    Plug 'prabirshrestha/asyncomplete-tags.vim'
    Plug 'prabirshrestha/vim-lsp'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'
            Plug 'machakann/vim-lsp-julia', {'for': 'julia'}
    Plug 'yami-beta/asyncomplete-omni.vim'
        Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
    Plug 'prabirshrestha/async.vim'
        Plug 'wellle/tmux-complete.vim'


" Erlang related autocomplete
Plug 'vim-erlang/erlang-motions.vim', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-skeletons', {'for': 'erlang',
            \'on': ['ErlServer', 'ErlStatem', 'ErlSupervisor', 'ErlEvent', 'ErlApplication', 'ErlEscript']}

" edit helper
Plug 'rstacruz/sparkup', {'for': 'html', 'rtp': 'vim'}
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}

Plug 'tyru/caw.vim'
Plug 'machakann/vim-sandwich'
Plug 'ludovicchabant/vim-gutentags'

" display enhancement
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesToggle'}

" filetype
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/context_filetype.vim'
Plug 'rescript-lang/vim-rescript'
Plug 'perplexedfingers/robotframework-vim'
Plug 'vim-scripts/django.vim', {'for': ['django', 'htmldjango']}
Plug 'rhysd/committia.vim', {'for': 'gitcommit'}
" vim: set ts=2 sw=2 tw=80 et
