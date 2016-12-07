" Plugins
" --------------------------------------------------------

function! s:vimproc_make()
  if dein#util#_is_windows()
    let l:cmd = 'tools\\update-dll-mingw'
  elseif dein#util#_is_cygwin()
    let l:cmd = 'make -f make_cygwin.mak'
  elseif executable('gmake')
    let l:cmd = 'gmake'
  else
    let l:cmd = 'make'
  endif
  let g:dein#plugin.build = l:cmd
endfunction

" Loaded on startup {{{
" ---
call dein#add('Shougo/dein.vim')
call dein#add('itchyny/vim-parenmatch')
call dein#add('itchyny/vim-cursorword')
call dein#add('itchyny/vim-gitbranch')
call dein#add('Shougo/vimproc.vim', {
  \'hook_post_update': 'call ' . s:vimproc_make()})
call dein#add('rafi/awesome-vim-colorschemes')
call dein#add('tyrannicaltoucan/vim-quantum')

" LAZY LOADING
" --------------------------------------------------------

" Language {{{
" --------
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
call dein#add('sheerun/vim-polyglot', {'on_path': '.*'})
call dein#add('Shougo/context_filetype.vim', {'lazy': 1})
call dein#add('robbles/logstash.vim', {'on_ft': 'logstash'})

" }}}
" Commands {{{
" --------
call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})
call dein#add('lambdalisue/vim-gita', {'on_cmd': 'Gita'})
call dein#add('t9md/vim-choosewin', {'on_map': {'n': '<Plug>'}})
call dein#add('haya14busa/incsearch.vim', {'on_map': {'vn': '<Plug>'}})
call dein#add('haya14busa/vim-asterisk', {'on_map': {'vn': '<Plug>'}})
call dein#add('osyo-manga/vim-anzu', {'on_map': {'vn': '<Plug>'}})
call dein#add('mbbill/undotree', {'on_cmd': 'UndotreeToggle'})
call dein#add('metakirby5/codi.vim', {'on_cmd': 'Codi'})
call dein#add('junegunn/vim-peekaboo', {'on_map': {'n': '"'}})
call dein#add('timkendrick/vim-indent', {
  \'on_cmd': ['IndentTabsToSpaces', 'IndentSpacesToTabs', 'IndentCleanup']})
call dein#add('tpope/vim-abolish', {'on_cmd': 'Subvert'})
call dein#add('tyru/caw.vim', {'on_map': {'nx': '<Plug>'}})
call dein#add('skywind3000/asyncrun.vim', {'on_cmd': 'AsyncRun'})
" }}}
" Interface {{{
" ---------
call dein#add('itchyny/lightline.vim', {'on_path': '.*',
  \ 'hook_add': 'source '.$VIMPATH.'/config/plugins/lightline.vim'})
call dein#add('airblade/vim-gitgutter', {'on_path': '.*'})
call dein#add('kshenoy/vim-signature', {'on_path': '.*'})
call dein#add('bronson/vim-trailing-whitespace', {'on_path': '.*'})
call dein#add('Yggdroot/indentLine', {'on_cmd': 'IndentLinesToggle'})
call dein#add('luochen1990/rainbow', {'on_path': '.*'})
call dein#add('zhaocai/GoldenView.Vim', {'on_map': {'n': '<Plug>GoldenView'},
  \ 'on_event': 'BufAdd'})
call dein#add('justinmk/vim-sneak', {'on_map': '<Plug>Sneak_'})
call dein#add('tpope/vim-repeat', {'on_map': '<Plug>(Repeat'})
call dein#add('rhysd/committia.vim', {'on_path': 'COMMIT_EDITMSG'})
call dein#add('Konfekt/FastFold', {
  \ 'on_event': 'BufEnter',
  \ 'hook_post_source': 'FastFoldUpdate'
  \ })
call dein#add('w0rp/ale', {'on_path': '.*'})
" }}}
" Completion {{{
" ----------
call dein#add('Shougo/deoplete.nvim', {
  \ 'if': 'has("nvim")',
  \ 'depends': 'vimproc.vim',
  \ 'on_event': 'InsertEnter',
  \ 'hook_source': 'let g:deoplete#enable_at_startup = 1'
  \   .' | source '.$VIMPATH.'/config/plugins/deoplete.vim'
  \ })
call dein#add('Shougo/neocomplete', {
  \ 'if': '! has("nvim") && has("lua")',
  \ 'depends': 'vimproc.vim',
  \ 'on_event': 'InsertEnter',
  \ 'hook_source': 'let g:neocomplete#enable_at_startup = 1'
  \   .' | source '.$VIMPATH.'/config/plugins/neocomplete.vim'
  \ })
call dein#add('Shougo/neoinclude.vim', {
  \'on_source': ['neocomplete.vim', 'deoplete.nvim']})
call dein#add('Shougo/neopairs.vim', {
  \'on_source': ['neocomplete.vim', 'deoplete.nvim']})

" need build
call dein#add('zchee/deoplete-go', {
  \'on_ft': 'go', 'on_event': 'InsertEnter',
  \'on_source': 'deoplete.nvim',
  \'if': 'has("nvim")'})
"" need python-jedi
"call dein#add('zchee/deoplete-jedi', {
"  \'on_ft': 'python', 'on_event': 'InsertEnter',
"  \'on_source': 'deoplete.nvim',
"  \'if': 'has("nvim")'})
call dein#add('Raimondi/delimitMate', {
  \ 'on_event': 'InsertEnter',
  \ 'hook_source': 'let g:delimitMate_expand_cr = 1',
  \ })
call dein#add('jsfaint/gen_tags.vim', {
  \'on_cmd': ['GenGTAGS', 'ClearGTAGS', 'GenAll', 'ClearCtags']})

call dein#add('mattn/emmet-vim', {
  \'on_event': 'InsertEnter', 'on_ft': ['css', 'html', 'jsx']})
call dein#add('dhruvasagar/vim-table-mode', {
  \'on_cmd': ['TableModeToggle', 'Tableize', 'TableSort']})
" }}}
" Operators {{{
" ---------
call dein#add('kana/vim-operator-user', {'lazy': 1})
call dein#add('kana/vim-operator-replace', {
  \ 'depends': 'vim-operator-user',
  \ 'on_map': {'vnx': '<Plug>'}
  \ })
call dein#add('rhysd/vim-operator-surround', {
  \ 'depends': 'vim-operator-user',
  \ 'on_map': {'n': '<Plug>'}
  \ })
call dein#add('haya14busa/vim-operator-flashy', {
  \ 'depends': 'vim-operator-user',
  \ 'on_map': {'nx': '<Plug>'}
  \ })

" }}}
" Text objects {{{
" ------------
call dein#add('kana/vim-textobj-user', {'lazy': 1})
call dein#add('osyo-manga/vim-textobj-multiblock', {
  \ 'depends': 'vim-textobj-user',
  \ 'on_map': {'ox': '<Plug>'}
  \ })
call dein#add('AndrewRadev/sideways.vim', {'on_map': {'ox': '<Plug>'}})
call dein#add('bkad/CamelCaseMotion', {
  \'on_map': {'nx': '<Plug>CamelCaseMotion'}})
" }}}

" vim: set ts=2 sw=2 tw=80 et :
