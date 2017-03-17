scriptencoding utf-8
" Plugin Settings
"---------------------------------------------------------
"}}}
if dein#tap('committia.vim')
  let g:committia_min_window_width = 70
  let g:committia_hooks = {}
  function! g:committia_hooks.edit_open(info)
    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
      resize 4
      startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
  endfunction
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

if dein#tap('vim-gitgutter')
  let g:gitgutter_map_keys = 0
  let g:gitgutter_sh = $SHELL

  nmap <Leader>hj <Plug>GitGutterNextHunk
  nmap <Leader>hk <Plug>GitGutterPrevHunk
  nmap <Leader>hs <Plug>GitGutterStageHunk
  nmap <Leader>hr <Plug>GitGutterUndoHunk
  nmap <Leader>hp <Plug>GitGutterPreviewHunk
endif

if dein#tap('caw.vim') "{{{
	let g:caw_hatpos_skip_blank_line = 1
	let g:caw_dollarpos_skip_blank_line = 1
	autocmd MyAutoCmd FileType * call s:init_caw()
	function! s:init_caw()
		if ! &l:modifiable
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> <Leader>v
			silent! xunmap <buffer> <Leader>v
			silent! nunmap <buffer> <Leader>V
			silent! xunmap <buffer> <Leader>V
		else
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> <Leader>V <Plug>(caw:tildepos:toggle)
			xmap <buffer> <Leader>V <Plug>(caw:tildepos:toggle)
			nmap <buffer> <Leader>v <Plug>(caw:zeropos:toggle)
			xmap <buffer> <Leader>v <Plug>(caw:zeropos:toggle)
		endif
	endfunction
endif

if dein#tap('gen_tags.vim') "{{{
  autocmd MyAutoCmd BufReadPost,FileReadPost,StdinReadPost *.py execute ":GenCtags"
  autocmd MyAutoCmd VimLeavePre *.py execute ":ClearCtags!"
  " Gtags supports only c, cpp and some (v6.5.3)
  autocmd MyAutoCmd BufReadPost,FileReadPost,StdinReadPost *.c{,pp} execute ":GenGTAGS"
  autocmd MyAutoCmd VimLeavePre *.c{,pp} execute ":ClearGTAGS!"
endif

"}}}
if dein#tap('ale') "{{{
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_enter = 0
  let g:ale_sign_column_always = 1
endif

"}}}
if dein#tap('Neoformat') "{{{
  let g:neoformat_python_autopep8 = {
    \ 'exe': 'autopep8',
    \ 'args': ['-s 4', '-E'],
    \ 'replace': 1,
    \ 'stdin': 1,
    \ 'no_append': 1,
    \ }

  let g:neoformat_enabled_python = ['autopep8']

  " Enable alignment
  let g:neoformat_basic_format_align = 1

  " Enable tab to spaces conversion
  let g:neoformat_basic_format_retab = 1

  " Enable trimmming of trailing whitespace
  let g:neoformat_basic_format_trim = 1
endif

"}}}
if dein#tap('vim-table-mode') "{{{
  autocmd MyAutoCmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
  autocmd MyAutoCmd BufEnter *.rst let g:table_mode_corner_corner="+"
    \ | let g:table_mode_header_fillchar="="
endif
"}}}
" vim: set ts=2 sw=2 tw=80 et :
