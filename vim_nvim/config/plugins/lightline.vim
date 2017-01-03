scriptencoding utf-8

let g:lightline = {
  \ 'colorscheme': 'PaperColor',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&readonly?"x":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \  },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
  \   'fugitive': 'LightLineFugitive',
  \   'filename': 'LightLineFilename',
  \   'fileformat': 'LightLineFileformat',
  \   'filetype': 'LightLineFiletype',
  \   'fileencoding': 'LightLineFileencoding',
  \   'mode': 'LightLineMode',
  \ },
  \ 'separator': { 'left': '|', 'right': '|' },
  \ 'subseparator': { 'left': '|', 'right': '|' },
  \ }

function! LightLineModified()
    return &filetype =~? 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
    return ('' !=? LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ (&filetype ==? 'vimfiler' ? vimfiler#get_status_string() :
    \  &filetype ==? 'unite' ? unite#get_status_string() :
    \  &filetype ==? 'vimshell' ? vimshell#get_status_string() :
    \ '' !=? expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' !=? LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    if &filetype !~? 'vimfiler\|gundo' && exists('*fugitigveg#head')
        let l:branch = fugitive#head()
        return l:branch !=# '' ? '⭠ '.l:branch : ''
    endif
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
