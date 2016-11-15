scriptencoding utf-8
" Plugin Settings
"---------------------------------------------------------

if dein#tap('vim-commentary')
  xmap gc  <Plug>Commentary
  nmap gc  <Plug>Commentary
  omap gc  <Plug>Commentary
  nmap gcc <Plug>CommentaryLine
  nmap cgc <Plug>ChangeCommentary
  nmap gcu <Plug>Commentary<Plug>Commentary
endif

if dein#tap('deoplete-jedi') && has('nvim') "{{{
  autocmd MyAutoCmd FileType python setlocal omnifunc=
endif

"}}}
if dein#tap('neocomplete') && has('lua') "{{{
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#data_directory = $VARPATH.'/complete'
endif

"}}}
if dein#tap('emmet-vim') "{{{
  let g:use_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
  let g:user_emmet_install_command = 0
  let g:user_emmet_mode = 'i'

  autocmd MyAutoCmd FileType html,css,jsx,javascript.jsx
    \ EmmetInstall
    \ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

"}}}
if dein#tap('vim-operator-surround') "{{{
  map <silent>sa <Plug>(operator-surround-append)
  map <silent>sd <Plug>(operator-surround-delete)
  map <silent>sr <Plug>(operator-surround-replace)
  nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
  nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
endif

"}}}
if dein#tap('vim-operator-replace') "{{{
  xmap p <Plug>(operator-replace)
endif

"}}}
if dein#tap('vim-operator-flashy') "{{{
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
endif

"}}}
if dein#tap('committia.vim') "{{{
  let g:committia_min_window_width = 79
  let g:committia_hooks = {}
  function! g:committia_hooks.edit_open(info)
    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
      resize 4
      startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
  endfunction
endif

"}}}
if dein#tap('vim-textobj-multiblock') "{{{
  omap ab <Plug>(textobj-multiblock-a)
  omap ib <Plug>(textobj-multiblock-i)
  xmap ab <Plug>(textobj-multiblock-a)
  xmap ib <Plug>(textobj-multiblock-i)
endif

"}}}
if dein#tap('vim-signature') "{{{
  let g:SignatureMarkTextHLDynamic = 1
  let g:SignatureMarkerTextHLDynamic = 1
  let g:SignaturePurgeConfirmation = 1
  let g:SignatureDeleteConfirmation = 0
  let g:SignatureForceRemoveGlobal = 1
  let g:signature_set_location_list_convenience_maps = 0
  let g:SignatureMap = {
    \ 'ListBufferMarks':   'm/',
    \ 'ListBufferMarkers': 'm?',
    \ 'Leader':            'm',
    \ 'PlaceNextMark':     'm,',
    \ 'ToggleMarkAtLine':  'm.',
    \ 'PurgeMarksAtLine':  'm-',
    \ 'DeleteMark':        'dm',
    \ 'PurgeMarks':        'm<Space>',
    \ 'PurgeMarkers':      'm<BS>',
    \ 'GotoNextSpotAlpha': 'mn',
    \ 'GotoPrevSpotAlpha': 'mp',
    \ 'GotoNextMarkerAny': 'mj',
    \ 'GotoPrevMarkerAny': 'mk',
    \ 'GotoNextMarker': '',
    \ 'GotoPrevMarker': '',
    \ 'GotoNextLineAlpha': '',
    \ 'GotoPrevLineAlpha': '',
    \ 'GotoNextSpotByPos': '',
    \ 'GotoPrevSpotByPos': '',
    \ 'GotoNextLineByPos': '',
    \ 'GotoPrevLineByPos': ''
    \ }
endif

"}}}
if dein#tap('vim-peekaboo') "{{{
  nnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  0)<cr>
  xnoremap <buffer> <silent> " :<c-u>call peekaboo#peek(v:count1, 'quote',  1)<cr>
  nnoremap <buffer> <silent> @ :<c-u>call peekaboo#peek(v:count1, 'replay', 0)<cr>
  inoremap <buffer> <silent> <c-r> <c-o>:call peekaboo#peek(1, 'ctrl-r',  0)<cr>
endif

"}}}

if dein#tap('vim-expand-region')
  nmap = <Plug>(expand_region_expand)
  nmap + <Plug>(expand_region_shrink)
endif

if dein#tap('nerdtree')
  map <F6> :NERDTreeToggle<CR>
endif

if dein#tap('tagbar')
  map <F7> :TagbarToggle<CR>
  let g:tagbar_iconchars = ['▸', '▾']
endif

if dein#tap('vim-sneak')
    nmap s <Plug>Sneak_s
    nmap S <Plug>Sneak_S
    xmap s <Plug>Sneak_s
    xmap S <Plug>Sneak_S
    omap s <Plug>Sneak_s
    omap S <Plug>Sneak_S
endif

if dein#tap('rainbow')
  let g:rainbow_active = 1
endif

if dein#tap('vim-choosewin') "{{{
  nmap _         <Plug>(choosewin)
  nmap <Leader>- :<C-u>ChooseWinSwap<CR>

  let g:choosewin_label = 'FGHJKLZXCVBNM'
  let g:choosewin_overlay_enable = 1
  let g:choosewin_statusline_replace = 1
  let g:choosewin_tabline_replace = 1
  let g:choosewin_label_padding = 3
  let g:choosewin_blink_on_land = 0

  let g:choosewin_color_label = {
    \ 'cterm': [ 236, 2 ], 'gui': [ '#555555', '#000000' ] }
  let g:choosewin_color_label_current = {
    \ 'cterm': [ 234, 220 ], 'gui': [ '#333333', '#000000' ] }
  let g:choosewin_color_other = {
    \ 'cterm': [ 235, 235 ], 'gui': [ '#333333' ] }
  let g:choosewin_color_overlay = {
    \ 'cterm': [ 2, 10 ], 'gui': [ '#88A2A4' ] }
  let g:choosewin_color_overlay_current = {
    \ 'cterm': [ 72, 64 ], 'gui': [ '#7BB292' ] }
endif

"}}}
if dein#tap('vim-gitgutter') "{{{
" let g:gitgutter_realtime = 1
" let g:gitgutter_eager = 0
  let g:gitgutter_map_keys = 0

  nmap <Leader>hj <Plug>GitGutterNextHunk
  nmap <Leader>hk <Plug>GitGutterPrevHunk
  nmap <Leader>hs <Plug>GitGutterStageHunk
  nmap <Leader>hr <Plug>GitGutterUndoHunk
  nmap <Leader>hp <Plug>GitGutterPreviewHunk
endif

"}}}
if dein#tap('neomake') "{{{
  autocmd MyAutoCmd BufWritePost * call <SID>neomake_custom()
  function! s:neomake_custom()
    let l:filetypes = [
      \   'ansible', 'python', 'php', 'ruby', 'vim', 'go', 'sh',
      \   'html', 'javascript', 'javascript.jsx', 'css', 'yaml'
      \ ]

    if empty(&buftype) && index(l:filetypes, &filetype) > -1
      Neomake
    endif
  endfunction
endif

"}}}
if dein#tap('vim-markdown') "{{{
  let g:vim_markdown_initial_foldlevel = 5
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_conceal = 0
endif

"}}}
if dein#tap('undotree') "{{{
  nnoremap <Leader>gu  :UndotreeToggle<CR>
endif

"}}}
if dein#tap('vim-anzu') "{{{
  let g:anzu_status_format = 'match %i of %l'

  autocmd MyAutoCmd CursorMoved * call anzu#clear_search_status()
endif

"}}}
if dein#tap('incsearch.vim') "{{{
  let g:incsearch#auto_nohlsearch = 1

  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  map n <Plug>(incsearch-nohl)<Plug>(anzu-n)
  map N <Plug>(incsearch-nohl)<Plug>(anzu-N)

  map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)<Plug>(anzu-update-search-status)
  map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)<Plug>(anzu-update-search-status)
  map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)<Plug>(anzu-update-search-status)
  map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)<Plug>(anzu-update-search-status)

  map z*  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)<Plug>(anzu-update-search-status)
  map gz* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)<Plug>(anzu-update-search-status)
  map z#  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)<Plug>(anzu-update-search-status)
  map gz# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)<Plug>(anzu-update-search-status)
endif

"}}}
if dein#tap('sideways.vim') "{{{
  nnoremap <silent> m" :SidewaysJumpLeft<CR>
  nnoremap <silent> m' :SidewaysJumpRight<CR>
  omap a, <Plug>SidewaysArgumentTextobjA
  xmap a, <Plug>SidewaysArgumentTextobjA
  omap i, <Plug>SidewaysArgumentTextobjI
  xmap i, <Plug>SidewaysArgumentTextobjI
endif

"}}}
if dein#tap('CamelCaseMotion') "{{{
  nmap <silent> e <Plug>CamelCaseMotion_e
  nmap <silent> w <Plug>CamelCaseMotion_w
  xmap <silent> w <Plug>CamelCaseMotion_w
  omap <silent> W <Plug>CamelCaseMotion_w
  nmap <silent> b <Plug>CamelCaseMotion_b
  xmap <silent> b <Plug>CamelCaseMotion_b
  omap <silent> B <Plug>CamelCaseMotion_b
endif

"}}}
if dein#tap('gen_tags.vim') "{{{
  autocmd MyAutoCmd BufReadPost,FileReadPost,StdinReadPost *.c{,pp} execute ":GenGTAGS"
  autocmd MyAutoCmd VimLeavePre *.c{,pp} execute ":ClearGTAGS!"
  " Gtags supports only c, cpp and some (v6.5.3)
  autocmd MyAutoCmd BufReadPost,FileReadPost,StdinReadPost *.{py,js} execute ":GenAll"
  autocmd MyAutoCmd VimLeavePre *.{py,js} execute ":ClearCtags!"
endif

"}}}
if dein#tap('ale') "{{{
  let g:ale_sign_column_always = 1
endif

"}}}
" vim: set ts=2 sw=2 tw=80 et :
