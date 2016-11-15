vim := $(if $(shell which nvim),nvim,$(shell which vim))
vim_version := '${shell $(vim) --version}'
XDG_CACHE_HOME ?= $(HOME)/.cache

default: install

install:
	pip install flake8 vim-vint yamllint jedi
	@mkdir -vp "$(XDG_CACHE_HOME)/vim/"{backup,session,swap,tags,undo,view}; \
	$(vim) -c 'call dein#recache_runtimepath() | echo "Installation complete!"' +q

update:
	@git pull --ff --ff-only; \
	$(vim) --cmd 'set nomore' -c 'call dein#clear_state() | call dein#update()' +q
upgrade: update

uninstall:
	rm -rf "$(XDG_CACHE_HOME)/vim"

test:
ifeq ('$(vim)','nvim')
	$(info Testing NVIM...)
	$(if $(findstring NVIM,$(vim_version)),\
		$(info OK),\
		$(error   .. MISSING! Is Neovim available in PATH?))
else
	$(info Testing VIM 8.0...)
	$(if $(findstring 8.0$(vim_version)),\
		$(info OK),\
		$(error .. MISSING! Is Vim 8.0 available in PATH?))

	$(info Testing +lua... )
	$(if $(findstring +lua,$(vim_version)),\
		$(info OK),\
		$(error   .. MISSING! Install $(vim) with "+lua" enabled))

	$(info Testing +python... )
	$(if $(findstring +python,$(vim_version)),\
		$(info OK),\
		$(error .. MISSING! Install $(vim) with "+python" enabled))

	$(info Testing +job... )
	$(if $(findstring +job,$(vim_version)),\
		$(info OK),\
		$(error .. MISSING! Install $(vim) with "+job" enabled))
endif
	$(info Testing pip...)
	$(if $(shell which pip), $(info OK),\
		$(error .. MISSING! Is pip available in PATH?))
	@echo All tests passed, hooray!


.PHONY: install update upgrade uninstall test
