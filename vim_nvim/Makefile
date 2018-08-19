vim := $(if $(shell which nvim),nvim,$(shell which vim))
vim_version := '${shell $(vim) --version}'
XDG_CACHE_HOME ?= $(HOME)/.cache

.DEFAULT: install

install:
	pip install --user flake8 vim-vint yamllint python-language-server isort autopep8 neovim proselint
	@mkdir -vp "$(XDG_CACHE_HOME)/vim/"{backup,session,swap,tags,undo,view}; \
	$(vim) -c 'call dein#recache_runtimepath() | echo "Installation complete!"' +q

test:
	ifeq ('$(vim)', 'nvim')
		$(info Testing NVIM...)
		$(if $(findstring NVIM, $(vim_version)),\
			$(info OK),\
			$(error .. MISSING! Is Neovim available in PATH?))
	else
		$(info Testing VIM 8.0...)
		$(if $(findstring 8.0, $(vim_version)),\
			$(info OK),\
			$(error .. MISSING! Is Vim 8.0 available in PATH?))

		$(info Testing +lua... )
		$(if $(findstring +lua, $(vim_version)),\
			$(info OK),\
			$(error .. MISSING! Install $(vim) with "+lua" enabled))

		$(info Testing +python... )
		$(if $(findstring +python, $(vim_version)),\
			$(info OK),\
			$(error .. MISSING! Install $(vim) with "+python" enabled))

		$(info Testing +job... )
		$(if $(findstring +job, $(vim_version)),\
			$(info OK),\
			$(error .. MISSING! Install $(vim) with "+job" enabled))
	endif
    $(info Testing pip...)
    $(if $(shell which pip),\
		$(info OK),\
        $(error .. MISSING! Is pip available in PATH?))


.PHONY: install test
