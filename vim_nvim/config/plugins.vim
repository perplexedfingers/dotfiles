" Plugins
" --------------------------------------------------------

" Loaded on startup {{{
" ---
call dein#add('Shougo/dein.vim')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('tyrannicaltoucan/vim-quantum')

" LAZY LOADING
" --------------------------------------------------------

" Commands {{{
" --------
call dein#add('lambdalisue/gina.vim', {'on_cmd': 'Gina'})
call dein#add('mhinz/vim-grepper', {'on_cmd': ['Grepper', 'GrepperAg']})
call dein#add('jsfaint/gen_tags.vim', {
  \'on_cmd': ['GenCtags', 'ClearCtags', 'GenGTAGS', 'ClearGTAGS']})
call dein#add('timkendrick/vim-indent', {
  \'on_cmd': ['IndentTabsToSpaces', 'IndentSpacesToTabs', 'IndentCleanup']})
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})
call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})
call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})
call dein#add('dhruvasagar/vim-table-mode', {
  \'on_cmd': ['TableModeToggle', 'Tableize', 'TableSort']})
call dein#add('benekastah/neomake', {'on_cmd': 'Neomake',
  \'hook_add': 'source'.$VIMPATH.'/config/plugins/neomake.vim'})

" }}}

" Shorcuts {{{
" --------
call dein#add('tyru/caw.vim', {'on_map': {'nx': '<Plug>'}})
call dein#add('justinmk/vim-sneak', {'on_map': '<Plug>Sneak_'})
call dein#add('tpope/vim-surround', {'on_path': '.*'})

" }}}

" Interface {{{
" ---------
call dein#add('itchyny/lightline.vim', {'on_path': '.*',
  \'hook_add': 'source '.$VIMPATH.'/config/plugins/lightline.vim'})
call dein#add('airblade/vim-gitgutter', {'on_path': '.*'})
call dein#add('ntpeters/vim-better-whitespace', {'on_path': '.*'})
call dein#add('luochen1990/rainbow', {'on_path': '.*'})
call dein#add('itchyny/vim-cursorword', {'on_path': '.*'})
call dein#add('jiangmiao/auto-pairs', {'on_path': '.*'})
call dein#add('sheerun/vim-polyglot', {'on_path': '.*'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})

" }}}

" Completion {{{
" ----------
call dein#add('roxma/nvim-completion-manager', {'on_ft': 'python'})
call dein#add('vim-erlang/vim-erlang-tags', {'on_ft': 'erlang'})
call dein#add('vim-erlang/vim-erlang-omnicomplete', {'on_ft': 'erlang'})

" }}}

" vim: set ts=2 sw=2 tw=80 et
