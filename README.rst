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

    nvim --headless -c 'call dein#update() | messages | q'

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


Note for Python3 packages
========================

- pynvim
- python-language-server[all]
- isort
  - pyls-isort
- ipython
- bpython


Note for command line tools
===========================

- tmux
- neovim
- ripgrep
- bat
- fd
- fish
- git
- mecurial
- fossil
- pijul
- rsync
- nix
- tree
- watch
- doas
- git-delta
- shellcheck
- ncdu
- hunspell
- universal-ctags
- httpie
- xh
- erlang_ls
