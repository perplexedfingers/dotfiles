" " Dictionary: take mode() input -> longer notation of current mode
" " mode() is defined by Vim
" let g:currentmode={
"            \'n' : 'Normal',
"            \'niI' : 'Normal Insert',
"            \'niR' : 'Normal Replace',
"            \'niV' : 'Normal Virtual-Replace',
"            \'nt' : 'Normal Terminal',
"            \'no' : 'N·Operator Pending',
"            \'nov' : 'N·Operator Pending',
"            \'noV' : 'N·Operator Pending',
"            \'no^V' : 'N·Operator Pending',
"            \'v' : 'Visual',
"            \'vs' : 'Visual',
"            \'V' : 'V·Line',
"            \'Vs' : 'V·Line',
"            \'^V' : 'V·Block',
"            \'^Vs' : 'V·Block',
"            \'s' : 'Select',
"            \'S': 'S·Line',
"            \'^S' : 'S·Block',
"            \'i' : 'Insert',
"            \'ic' : 'Insert Completion',
"            \'ix' : 'Insert',
"            \'R' : 'Replace',
"            \'Rc' : 'Replace Completion',
"            \'Rv' : 'V·Replace',
"            \'Rvc' : 'V·Replace  Completion',
"            \'Rvx' : 'V·Replace',
"            \'c' : 'Command',
"            \'cv' : 'Vim Ex',
"            \'ce' : 'Ex',
"            \'r' : 'Prompt',
"            \'rm' : 'More',
"            \'r?' : 'Confirm',
"            \'!' : 'Shell',
"            \'t' : 'Terminal '
"            \}

" " Function: return current mode
" " abort -> function will abort soon as error detected
" function! DisplayCurrentMode() abort
"     let l:modecurrent = mode()
"     " use get() -> fails safely, since ^V doesn't seem to register
"     " 3rd arg is used when return of mode() == 0, which is case with ^V
"     " thus, ^V fails -> returns 0 -> replaced with 'V Block'
"     let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
"     let l:current_status_mode = l:modelist
"     return l:current_status_mode
" endfunction

function! DisplayGitBranchName()
    let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return strlen(l:branchname) > 0? l:branchname : 'NO VCS'
endfunction

set statusline=
set statusline+=[%F]
set statusline+=%y  " [FileType]
set statusline+=%m  " [+/-]
set statusline+=%r  " [RO]
set statusline+=%w  " [Preview]
set statusline+=%h  " [help]
set statusline+=%q  " [Location List]

set statusline+=%=

set statusline+=[%{DisplayGitBranchName()}]
set statusline+=[%04lL,%03cC]
set statusline+=[%P]
" set statusline+=[%{DisplayCurrentMode()}]
