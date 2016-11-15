let s:save_cpo = &cpo
set cpo&vim

if exists('b:undo_ftplugin')
	let b:undo_ftplugin .= ' | '
else
	let b:undo_ftplugin = ''
endif
let b:undo_ftplugin .= 'setl modeline<'

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal iskeyword+=:,#
setlocal foldenable
setlocal foldmethod=marker
setlocal keywordprg=:help

" For gf
let &l:path = join(map(split(&runtimepath, ','), 'v:val."/autoload"'), ',')
setlocal suffixesadd=.vim
setlocal includeexpr=fnamemodify(substitute(v:fname,'#','/','g'),':h')

let &cpo = s:save_cpo
