scriptencoding utf-8

" Neomake
" ---------

let g:neomake_verbose = 1
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

let g:neomake_error_sign = {'text': '✖', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '◆', 'texthl': 'WarningMsg'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': '§', 'texthl': 'NeomakeInfoSign'}

let g:neomake_python_coala_maker = {
  \ 'args': ['--no-config',
  \          '--bears=CPDBear,PEP8Bear,PyImportSortBear,PyUnusedCodeBear,RadonBear',
  \          '--files']}

let g:neomake_html_jsbeautify_maker = {
  \'exe': 'js-beautify',
  \'args': ['--space-in-paren', '--jslint-happy',
  \         '--space-after-a-non-function']}

let g:neomake_css_jsbeautify_maker = {
  \'exe': 'js-beautify',
  \'args': ['--space-in-paren', '--jslint-happy',
  \         '--space-after-a-non-function']}

let g:neomake_javascript_jsbeautify_maker = {
  \'exe': 'js-beautify',
  \'args': ['--space-in-paren', '--jslint-happy',
  \         '--space-after-a-non-function']}

" let g:neomake_python_enabled_makers = ['coala']
" let g:neomake_html_enabled_makers = ['jsbeautify']
" let g:neomake_css_enabled_makers = ['jsbeautify']
" let g:neomake_javascript_enabled_makers = ['jsbeautify']

" vim: set ts=2 sw=2 tw=80 et :
