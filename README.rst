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

update vim/neovim package from command line
========

.. code:: sh

    nvim --headless -c 'call dein#update() | q'

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
    ln -s path/to/gitcommit ~/.config/git/config


note for Python3 packages
========================

- prospector
- neovim
- python-language-server
- ipython
- autotpep8
- isort
- thefuck
- vim-vint
- proselint


note for command line tools
===========================

- curl
- wget
- tmux
- neovim
- ripgrep
- bat
- fd
- fish
- git
- mecurial
- fossil
- python3
- rust
- rsync
- tree
- watch
- sudo
- kr
- shellcheck
- mosh
- ncdu
- hunspell
- ctags
- global(gtags)
