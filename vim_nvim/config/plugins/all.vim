scriptencoding utf-8
" Plugin Settings
"---------------------------------------------------------
if dein#tap('committia.vim')
  let g:committia_min_window_width = 70
endif

if dein#tap('tagbar')
  map <F7> :TagbarToggle<CR>
  let g:tagbar_iconchars = ['+', '-']
endif

if dein#tap('vim-sneak')
endif

if dein#tap('rainbow')
  let g:rainbow_active = 1
endif

if dein#tap('vim-gitgutter')
  let g:gitgutter_sh = $SHELL
  set signcolumn=yes
endif

if dein#tap('caw.vim')
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

if dein#tap('gen_tags.vim')
  autocmd MyAutoCmd BufReadPost,FileReadPost,StdinReadPost *.py execute ":GenCtags"
  autocmd MyAutoCmd VimLeavePre *.py execute ":ClearCtags!"
  " Gtags supports only c, cpp and some (v6.5.3)
  autocmd MyAutoCmd BufReadPost,FileReadPost,StdinReadPost *.c{,pp} execute ":GenGTAGS"
  autocmd MyAutoCmd VimLeavePre *.c{,pp} execute ":ClearGTAGS!"
endif

if dein#tap('neoformat')
  let g:neoformat_enabled_python = ['autopep8', 'isort']

  let g:neoformat_python_autopep8 = {
        \'exe': 'autopep8',
        \'stdin': 1,
        \'args': ['-',
        \         '--aggressive']
        \}
  let g:neoformat_python_isort = {
        \'exe': 'isort',
        \'stdin': 1,
        \'args': ['-',
        \         '--combine-star',
        \         '--combine-as',
        \         '--order-by-type',
        \         '--multi_line 0',
        \         '--balanced',
        \         '--quiet']
        \}

  let g:neoformat_try_formatprg = 1
  let g:neoformat_basic_format_align = 1
  let g:neoformat_basic_format_retab = 1
  let g:neoformat_basic_format_trim = 1
endif

if dein#tap('neomake')
  let g:neomake_python_flake8_maker = {'args': ['--ignore=E501']}
  let g:neomake_python_python3_maker = {
        \ 'errorformat': '%E%f:%l:%c: %m',
        \ 'serialize': 1,
        \ 'serialize_abort_on_error': 1,
        \ 'output_stream': 'stdout',
        \ }
  let g:neomake_open_list = 1
endif

if dein#tap('vim-table-mode')
  autocmd MyAutoCmd BufEnter *.md,*.makrdown let g:table_mode_corner="|"
  autocmd MyAutoCmd BufEnter *.rst let g:table_mode_corner_corner="+"
    \ | let g:table_mode_header_fillchar="="
endif

if dein#tap('papercolor-theme')
  let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     }
  \ }
  \}
endif
" vim: set ts=2 sw=2 tw=80 et :
