For vim/neovim with XDG support
===============================

.. code:: sh

    mkdir ~/.config
    cd ~/.config
    ln -s path/to/vim_nvim nvim
    cd nvim
    make test
    make install

For vim/neovim without XDG support
==================================

.. code:: sh

    cd ~
    ln -s path/to/vim_nvim .vim
    cd .vim
    make test
    make install

Update vim/neovim package from command line
===========================================

.. code:: sh

    # for vim-plug
    vim -es -u vimrc -i NONE -c "PlugInstall" -c "PlugUpdate" -c "PlugUpgrade" -c "qa"
    # for dein
    nvim --headless -c "call dein#update() | call map(dein#check_clean(), { _, val -> delete(val, 'rf')}) | call dein#recache_runtimepath() | messages | q"

For tmux
========

.. code:: sh

    cd ~
    ln -s path/to/tmux.conf .tmux.conf

Prefix key combinations is ``C-g``

For git configuration
=====================

.. code:: sh

    cd ~
    ln -s path/to/gitmessage .gitmessage
    ln -s path/to/gitconfig .gitconfig

For helix configuration
=====================

.. code:: sh

    cd ~/.config/helix
    ln -s path/to/config config.toml
    ln -s path/to/lang languages.toml

For ghostty configuration
=====================

.. code:: sh

    cd ~/Library/Application\ Support/com.mitchellh.ghostty
    ln -s path/to/config config


Note for Python-based tools
===========================

- pipx
- ipython
- bpython
- pipenv
- hatch
- pyenv
- proselint
- mecurial

Note for Rust-based tools
=========================

- ripgrep
- bat
- eza
- difftastic
- xh
- fd
- helix
- uv
- biome
- ruff
- procs
- sd
- dust
- bottom
- grex
- ty


Note for command line tools
===========================

- fish
- git
- fossil
- rsync
- nix
- watch
- doas
- shellcheck
- hunspell
- universal-ctags
- erlang_ls
- nmap
- jq
- ghostty
