" Plugins
" --------------------------------------------------------

" Loaded on startup {{{
" ---
call dein#add('Shougo/dein.vim')
call dein#add('itchyny/vim-parenmatch')
call dein#add('itchyny/vim-cursorword')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('tyrannicaltoucan/vim-quantum')
call dein#add('jiangmiao/auto-pairs')

" LAZY LOADING
" --------------------------------------------------------

" Language {{{
" --------
call dein#add('Shougo/context_filetype.vim', {'on_path': '.*'})
call dein#add('sheerun/vim-polyglot', {'on_path': '.*'})
call dein#add('mustache/vim-mustache-handlebars', {'on_ft': 'html'})
call dein#add('mitsuhiko/vim-jinja', {'on_ft': ['htmljinja', 'jinja']})
call dein#add('hail2u/vim-css3-syntax', {'on_ft': 'css'})
call dein#add('othree/csscomplete.vim', {'on_ft': 'css'})
call dein#add('chrisbra/csv.vim', {'on_ft': 'csv'})
call dein#add('PotatoesMaster/i3-vim-syntax', {'on_ft': 'i3'})
call dein#add('jstrater/mpvim', {'on_ft': 'portfile'})
call dein#add('tpope/vim-git', {
  \'on_ft': ['gitcommit', 'gitrebase', 'gitconfig', 'gitsendemail']})
call dein#add('vim-jp/syntax-vim-ex', {'on_ft': 'vim'})
call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
call dein#add('robbles/logstash.vim', {'on_ft': 'logstash'})
call dein#add('kylef/apiblueprint.vim', {'on_ft': 'apiblueprint'})

" }}}

" Commands {{{
" --------
call dein#add('lambdalisue/gina.vim', {'on_cmd': 'Gina'})
call dein#add('jsfaint/gen_tags.vim', {
  \'on_cmd': ['GenCtags', 'ClearCtags', 'GenGTAGS', 'ClearGTAGS']})
call dein#add('timkendrick/vim-indent', {
  \'on_cmd': ['IndentTabsToSpaces', 'IndentSpacesToTabs', 'IndentCleanup']})
call dein#add('tpope/vim-abolish', {'on_cmd': ['Subvert', 'Abolish']})
call dein#add('tyru/caw.vim', {'on_map': {'nx': '<Plug>'}})
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})
call dein#add('sbdchd/neoformat', {'on_cmd': 'Neoformat'})
call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})
call dein#add('dhruvasagar/vim-table-mode', {
  \'on_cmd': ['TableModeToggle', 'Tableize', 'TableSort']})

" }}}

" Interface {{{
" ---------
call dein#add('itchyny/lightline.vim', {'on_path': '.*',
  \'hook_add': 'source '.$VIMPATH.'/config/plugins/lightline.vim'})
call dein#add('airblade/vim-gitgutter', {'on_path': '.*'})
call dein#add('bronson/vim-trailing-whitespace', {'on_path': '.*'})
call dein#add('luochen1990/rainbow', {'on_path': '.*'})
call dein#add('justinmk/vim-sneak', {'on_map': '<Plug>Sneak_'})
call dein#add('tpope/vim-repeat', {'on_map': '<Plug>(Repeat'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})
call dein#add('w0rp/ale', {'on_path': '.*'})
call dein#add('dodie/vim-disapprove-deep-indentation', {
  \'on_ft': ['javascript']})

" }}}

" Completion {{{
" ----------
call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})

" }}}
" vim: set ts=2 sw=2 tw=80 et :
