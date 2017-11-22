for vim/neovim with XDG support
==========

.. code:: sh

    mkdir ~/.config
    cd ~/.config
    ln -s path/to/vim_nvim nvim
    cd nvim
    make test
    make install

for vim/neovim without XDG support
=======

.. code:: sh

    cd ~
    ln -s path/to/vim_nvim .vim
    cd .vim
    make test
    make install

for tmux
========

.. code:: sh

    cd ~
    ln -s path/to/tmux.conf .tmux.conf


for git configuration
=====================

.. code:: sh

    cd ~
    ln -s path/to/gitmessage .gitmessage
    ln -s path/to/gitcommit .gitcommit


note for Python packages
========================

- flake8
- vim-vint
- yamllint
- jedi
- neovim
- proselint
- http_promt
- ipython
- autotpep8
- isort
- shyaml
- glances
- jsbeautifier


note for command line tools
===========================

- tmux
- neovim
- ripgrep
- fd
- fish
- git
- mecurial
- fossil
- python3
- rsync
- sudo
- ctags
- global(gtags)
- tree
- shellcheck
- mosh
- ncdu
- hunspell
