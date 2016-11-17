Usage
=====

for neovim
----------
.. code:: sh

    mkdir -p ~/.config
    ln -s vim_nvim ~/.config/nvim
    cd ~/.config/nvim
    make test
    make install

for vim
-------
.. code:: sh

    ln -s vim_nvim ~/.vim
    cd ~/.vim
    make test
    make install

for tmux
--------
.. code-block:: shell

    ln -s .tmux.conf ~/.tmux.conf
