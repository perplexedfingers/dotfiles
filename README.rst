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
    ln -s path/to/gitcommit .gitcommit


note for Python packages
========================

- flake8
- vim-vint
- yamllint
- neovim
- python-language-server
- proselint
- http_prompt
- ipython
- autotpep8
- isort
- shyaml
- glances
- thefuck


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
- python3
- rsync
- sudo
.. - ctags
.. - global(gtags)
- tree
- shellcheck
- mosh
- ncdu
- hunspell
