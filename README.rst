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
    ln -s path/to/gitconfig .gitconfig


note for Python3 packages
========================

- neovim
- python-language-server[all]
- isort
  - pyls-isort
- ipython
- vim-vint
- proselint


note for command line tools
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
- rsync
- nix
- tree
- watch
- doas
- git-delta
- kr
- shellcheck
- ncdu
- hunspell
- universal-ctags
- ht
