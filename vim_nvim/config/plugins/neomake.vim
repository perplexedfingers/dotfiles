scriptencoding utf-8

" Neomake
" ---------
let g:neomake_python_flake8_maker = {'args': ['--ignore=E501']}
let g:neomake_python_python3_maker = {
      \ 'errorformat': '%E%f:%l:%c: %m',
      \ 'serialize': 1,
      \ 'serialize_abort_on_error': 1,
      \ 'output_stream': 'stdout',
      \ }
let g:neomake_open_list = 1

let g:neomake_verbose = 1
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

let g:neomake_error_sign = {'text': '✖', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '◆', 'texthl': 'WarningMsg'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': '§', 'texthl': 'NeomakeInfoSign'}

let g:lint_filetypes = [
  \  'python', 'vim', 'sh',
  \  'javascript', 'json', 'css',
  \  'markdown', 'html', 'yaml'
  \ ]

" vim: set ts=2 sw=2 tw=80 et :
