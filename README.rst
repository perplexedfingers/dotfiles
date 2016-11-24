Usage
=====

for neovim/vim with XDG support
----------
.. code:: sh

    mkdir ~/.config
    cd ~/.config
    ln -s path/to/vim_nvim nvim
    cd nvim
    make test
    make install

for vim/neovim without XDG support
-------
.. code:: sh

    cd ~
    ln -s path/to/vim_nvim .vim
    cd .vim
    make test
    make install

for tmux
--------
.. code:: sh

    cd ~
    ln -s path/to/.tmux.conf .tmux.conf


for git configuration
---------------------
.. code:: sh

    cd ~
    ln -s path/to/.gitmessage .gitmessage
    ln -s path/to/.gitcommit .gitcommit
