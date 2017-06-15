Vim configuration
=================

Lean mean Vim/Neovim machine, ~40ms startup time.
Best with Neovim or Vim 8.0+ with +lua and +python extensions enabled.

Features
========

- Neovim-centric
- Fast startup time
- Robust, yet light weight
- Lazy-load 90% of plugins with `dein`__
- Modular configuration
- Extensive ``deoplete`` and ``neocomplete`` setup
- Lightweight simple status
- Easy customizable theme
- Premium color-schemes

__ https://github.com/Shougo/dein.vim

Upgrade
=======

Run `make update`

XDG conformity
==============

VIM (Not Neovim!) looks for its configuration in the `~/.vim` directory.
My setup **also** supports the XDG location, `.config/vim`. If you want to
use the XDG specification standard, add this somewhere
in your `.profile` or `.bashrc`:

.. code:: sh

    # Set vimrc's location and source it on vim startup
    export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

If you're curious how it's done, see `vimrc:13-20`__

__ ./config/vimrc#L13-L20

and `init.vim:33-46`__ .

__ ./config/init.vim#L33-L46

Structure
=========

- `config`_ - Configuration

  - `plugins`_ - Plugin configurations
  - `bindings.vim`_ - Key bindings
  - `filetype.vim`_ - Language behavior
  - `general.vim`_ - General configuration
  - `/init.vim`_ - `runtimepath` initialization
  - `neovim.vim`_ - Neovim specific setup
  - `plugins.vim`_ - Plugin bundles
  - `terminal.vim`_ - Terminal configuration
  - `theme.vim`_ - Color-scheme and theme setup
  - `utils.vim`_ - Commands and functions
  - `/vimrc`_ - Initialization
- `ftplugin`_ - Language specific custom settings
- `init.vim`_ - Sources `config/vimrc`
- `vimrc`_ - Sources `config/vimrc`
.. _config: ./config/
.. _plugins: ./config/plugins/
.. _bindings.vim: ./config/bindings.vim
.. _filetype.vim: ./config/filetype.vim
.. _general.vim: ./config/general.vim
.. _/init.vim: ./config/init.vim
.. _neovim.vim: ./config/neovim.vim
.. _plugins.vim: ./config/plugins.vim
.. _terminal.vim: ./config/terminal.vim
.. _theme.vim: ./config/theme.vim
.. _utils.vim: ./config/utils.vim
.. _/vimrc: ./config/vimrc
.. _ftplugin: ./ftplugin/
.. _init.vim: ./init.vim
.. _vimrc: ./vimrc

Plugin Highlights
=================
- Package management with caching enabled and lazy loading
- Project-aware tabs and label
- PHP completion, indent, folds, syntax
- Languages: Ansible, css3, csv, json, less, markdown, mustache
- Helpers: Undo tree, bookmarks, git, tmux navigation, hex editor, sessions, and much more.

**Note** that 90% of the plugins are *lazy-loaded*.

Non Lazy-Loaded Plugins
=======================

+-------------------------+-----------------------------------------+
| Name                    | Description                             |
+=========================+=========================================+
| `dein`_                 | Dark powered Vim/Neovim plugin manager  |
+-------------------------+-----------------------------------------+
| `cursorword`_           | Underlines word under cursor            |
+-------------------------+-----------------------------------------+
| `vim-parenmatch`_       | Intelligent pair matching               |
+-------------------------+-----------------------------------------+
| `vim-quantum`_          | PaperColor alternative                  |
+-------------------------+-----------------------------------------+
| `context_filetype.vim`_ | Context filetype library for Vim script |
+-------------------------+-----------------------------------------+

.. _dein: https://github.com/Shougo/dein.vim
.. _cursorword: https://github.com/itchyny/vim-cursorword
.. _vim-quantum: https://github.com/tyrannicaltoucan/vim-quantum
.. _context_filetype.vim: https://github.com/Shougo/context_filetype.vim

Lazy-Loaded Plugins
===================

Language
--------
Mainly use `polyglot`_

+------------------+--------------------------------------------------------+
| Name             | Description                                            |
+==================+========================================================+
| `mustache`_      | Mustache and handlebars syntax                         |
+------------------+--------------------------------------------------------+
| `jinja`_         | Jinja support in vim                                   |
+------------------+--------------------------------------------------------+
| `css3-syntax`_   | CSS3 syntax support to vim's built-in `syntax/css.vim` |
+------------------+--------------------------------------------------------+
| `csv`_           | Handling column separated data                         |
+------------------+--------------------------------------------------------+
| `i3`_            | i3 window manager config syntax                        |
+------------------+--------------------------------------------------------+
| `portfile`_      | Macports portfile configuration files                  |
+------------------+--------------------------------------------------------+
| `vim-git`_       | Git support                                            |
+------------------+--------------------------------------------------------+
| `syntax-vim-ex`_ | Vim script syntax enhance                              |
+------------------+--------------------------------------------------------+
| `neco-vim`_      | Vim source for neocomplete/deoplete                    |
+------------------+--------------------------------------------------------+
| `logstash.vim`_  | Logstash support                                       |
+------------------+--------------------------------------------------------+

.. _polyglot: https://github.com/sheerun/vim-polyglot
.. _mustache: https://github.com/mustache/vim-mustache-handlebars
.. _jinja: https://github.com/mitsuhiko/vim-jinja
.. _css3-syntax: https://github.com/hail2u/vim-css3-syntax
.. _csv: https://github.com/chrisbra/csv.vim
.. _logstash: https://github.com/robbles/logstash.vim
.. _i3: https://github.com/PotatoesMaster/i3-vim-syntax
.. _portfile: https://github.com/jstrater/mpvim
.. _vim-git: https://github.com/tpope/vim-git
.. _syntax-vim-ex: https://github.com/vim-jp/syntax-vim-ex
.. _neco-vim: https://github.com/Shougo/neco-vim
.. _logstash.vim: https://github.com/robbles/logstash.vim

Commands
--------

+------------------+---------------------------------------------------------------------------------------------------------+
| Name             | Description                                                                                             |
+==================+=========================================================================================================+
| `caw.vim`_       | Vim comment plugin: supported operator/non-operator mappings, repeatable by dot-command, 300+ filetypes |
+------------------+---------------------------------------------------------------------------------------------------------+
| `gita`_          | An awesome git handling plugin                                                                          |
+------------------+---------------------------------------------------------------------------------------------------------+
| `indentline`_    | Display vertical indention lines                                                                        |
+------------------+---------------------------------------------------------------------------------------------------------+
| `vim-indent`_    | Tab Space convert                                                                                       |
+------------------+---------------------------------------------------------------------------------------------------------+
| `vim-abolish`_   | Replace variant of words                                                                                |
+------------------+---------------------------------------------------------------------------------------------------------+
| `tagbar`_        | Tag view                                                                                                |
+------------------+---------------------------------------------------------------------------------------------------------+

.. _caw.vim: https://github.com/tyru/caw.vim
.. _nerdtree: https://github.com/scrooloose/nerdtree
.. _gita: https://github.com/lambdalisue/vim-gita
.. _vim-asterisk: https://github.com/haya14busa/vim-asterisk
.. _vim-anzu: https://github.com/osyo-manga/vim-anzu
.. _undotree: https://github.com/mbbill/undotree
.. _codi: https://github.com/metakirby5/codi.vim
.. _vim-peekaboo: https://github.com/junegunn/vim-peekaboo
.. _vim-indent: https://github.com/timkendrick/vim-indent
.. _vim-abolish: https://github.com/tpope/vim-abolish
.. _tagbar: https://github.com/majutsushi/tagbar
.. _asyncrun: https://github.com/skywind3000/asyncrun.vim
.. _choosewin: https://github.com/t9md/vim-choosewin

Interface
---------

+------------------+-----------------------------------------------------+
| Name             | Description                                         |
+==================+=====================================================+
| `lightline`_     | Simple status line                                  |
+------------------+-----------------------------------------------------+
| `indentLine`_    | Indent guide                                        |
+------------------+-----------------------------------------------------+
| `rainbow`_       | Parenthesis highlight                               |
+------------------+-----------------------------------------------------+
| `vim-sneak`_     | Improved ``f`` and ``t``, but using ``s`` and ``S`` |
+------------------+-----------------------------------------------------+
| `committia`_     | Improved git commit panel                           |
+------------------+-----------------------------------------------------+
| `gitgutter`_     | Shows git diffs in the gutter                       |
+------------------+-----------------------------------------------------+
| `vim-repeat`_    | Improved ``.``                                      |
+------------------+-----------------------------------------------------+
| `ale`_           | Linter                                              |
+------------------+-----------------------------------------------------+

.. _indentline: https://github.com/Yggdroot/indentLine
.. _vim-parenmatch: https://github.com/itchyny/vim-parenmatch
.. _lightline: https://github.com/itchyny/lightline.vim
.. _vim-signature: https://github.com/kshenoy/vim-signature
.. _indentLine: https://github.com/Yggdroot/indentLine
.. _rainbow: https://github.com/luochen1990/rainbow
.. _GoldenView: https://github.com/zhaocai/GoldenView.Vim
.. _vim-sneak: https://github.com/justinmk/vim-sneak
.. _committia: https://github.com/rhysd/committia.vim
.. _FastFold: https://github.com/Konfekt/FastFold
.. _vim-repeat: https://github.com/tpope/vim-repeat
.. _ale: https://github.com/w0rp/ale
.. _gitgutter: https://github.com/airblade/vim-gitgutter

Completion
----------

+-------------------+---------------------------------------------------------------+
| Name              | Description                                                   |
+===================+===============================================================+
| `gen_tags`_       | Tags management                                               |
+-------------------+---------------------------------------------------------------+
| `neopairs`_       | Auto insert pairs when complete done                          |
+-------------------+---------------------------------------------------------------+
| `gen_tags`_       | A simple plugin generate ctags and gtags database for vim     |
+-------------------+---------------------------------------------------------------+
| `vim-table-mode`_ | VIM Table Mode for instant table creation                     |
+-------------------+---------------------------------------------------------------+

.. _delimitmate: https://github.com/Raimondi/delimitMate
.. _deoplete: https://github.com/Shougo/deoplete.nvim
.. _neocomplete: https://github.com/Shougo/neocomplete.vim
.. _emmet-vim: https://github.com/mattn/emmet-vim
.. _gen_tags: https://github.com/jsfaint/gen_tags.vim
.. _neoinclude: https://github.com/Shougo/neoinclude.vim
.. _neopairs: https://github.com/Shougo/neopairs.vim
.. _deoplete-go: https://github.com/zchee/deoplete-go
.. _deoplete-jedi: https://github.com/zchee/deoplete-jedi
.. _vim-table-mode: https://github.com/dhruvasagar/vim-table-mode

Custom Key bindings
===================

+----------------------+---------------+-----------------------------------------------------------------+
| Key                  | Mode          | Action                                                          |
+======================+===============+=================================================================+
| ``Space``            | Normal        | **Leader**                                                      |
+----------------------+---------------+-----------------------------------------------------------------+
| Arrows               | Normal        | Resize splits (* Enable `g:elite_mode` in `.vault.vim`)         |
+----------------------+---------------+-----------------------------------------------------------------+
| ``K``                | Normal        | Open Zeal or Dash on many file types (except Python+Vim script) |
+----------------------+---------------+-----------------------------------------------------------------+
| ``<leader>`` + ``y`` | Normal/visual | Copy selection to X11 clipboard ("+y)                           |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Enter``            | Normal        | Toggle fold (za)                                                |
+----------------------+---------------+-----------------------------------------------------------------+
| ``hjkl``             | Normal        | Smart cursor movements (g/hjkl)                                 |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``f``     | Normal        | Smart page forward (C-f/C-d)                                    |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``b``     | Normal        | Smart page backwards (C-b/C-u)                                  |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``e``     | Normal        | Smart scroll down (3C-e/j)                                      |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``y``     | Normal        | Smart scroll up (3C-y/k)                                        |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``q``     | Normal        | ``Ctrl`` + ``w``                                                |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``x``     | Normal        | Switch buffer and placement                                     |
+----------------------+---------------+-----------------------------------------------------------------+
| ``}``                | Normal        | After paragraph motion go to first non-blank char (}^)          |
+----------------------+---------------+-----------------------------------------------------------------+
| ``<``                | Visual/Normal | Indent to left and re-select                                    |
+----------------------+---------------+-----------------------------------------------------------------+
| ``>``                | Visual/Normal | Indent to right and re-select                                   |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Tab``              | Visual        | Indent to right and re-select                                   |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Shift`` + ``Tab``  | Visual        | Indent to left and re-select                                    |
+----------------------+---------------+-----------------------------------------------------------------+
| ``gp``               | Normal        | Select last paste                                               |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Q`` / ``gQ``       | Normal        | Disable EX-mode (<Nop>)                                         |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``a``     | Command       | Navigation in command line                                      |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``b``     | Command       | Move cursor backward in command line                            |
+----------------------+---------------+-----------------------------------------------------------------+
| ``Ctrl`` + ``f``     | Command       | Move cursor forward in command line                             |
+----------------------+---------------+-----------------------------------------------------------------+

File Operations
---------------

+-----------------------+---------------+------------------------------------------------------+
| Key                   | Mode          | Action                                               |
+=======================+===============+======================================================+
| ``<leader>`` + ``cd`` | Normal        | Switch to the directory of opened buffer (:cd %:p:h) |
+-----------------------+---------------+------------------------------------------------------+
| ``<leader>`` - ``w``  | Normal/visual | Write (:w)                                           |
+-----------------------+---------------+------------------------------------------------------+
| ``Ctrl`` + ``s``      | _All_         | Write (:w)                                           |
+-----------------------+---------------+------------------------------------------------------+
| ``W!!``               | Command       | Write as root                                        |
+-----------------------+---------------+------------------------------------------------------+

Editor UI
---------

+-----------------------+---------------+--------------------------------------------------+
| Key                   | Mode          | Action                                           |
+=======================+===============+==================================================+
| ``F2``                | _All_         | Toggle paste mode                                |
+-----------------------+---------------+--------------------------------------------------+
| ``F3``                | Normal        | Show highlight group that matches current cursor |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``ts`` | Normal        | Toggle spell-checker (:setlocal spell!)          |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``tn`` | Normal        | Toggle line numbers (:setlocal nonumber!)        |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``tl`` | Normal        | Toggle hidden characters (:setlocal nolist!)     |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``th`` | Normal        | Toggle highlighted search (:set hlsearch!)       |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``tw`` | Normal        | Toggle wrap (:setlocal wrap! breakindent!)       |
+-----------------------+---------------+--------------------------------------------------+
| ``g0``                | Normal        | Go to first tab (:tabfirst)                      |
+-----------------------+---------------+--------------------------------------------------+
| ``g$``                | Normal        | Go to last tab (:tablast)                        |
+-----------------------+---------------+--------------------------------------------------+
| ``gr``                | Normal        | Go to preview tab (:tabprevious)                 |
+-----------------------+---------------+--------------------------------------------------+
| ``Ctrl`` + ``j``      | Normal        | Move to split below (<C-w>j)                     |
+-----------------------+---------------+--------------------------------------------------+
| ``Ctrl`` + ``k``      | Normal        | Move to upper split (<C-w>k)                     |
+-----------------------+---------------+--------------------------------------------------+
| ``Ctrl`` + ``h``      | Normal        | Move to left split (<C-w>h)                      |
+-----------------------+---------------+--------------------------------------------------+
| ``Ctrl`` + ``l``      | Normal        | Move to right split (<C-w>l)                     |
+-----------------------+---------------+--------------------------------------------------+
| ``*``                 | Visual        | Search selection forwards                        |
+-----------------------+---------------+--------------------------------------------------+
| ``#``                 | Visual        | Search selection backwards                       |
+-----------------------+---------------+--------------------------------------------------+
| ``,`` + ``Space``     | Normal        | Remove all spaces at EOL                         |
+-----------------------+---------------+--------------------------------------------------+
| ``,`` + ``d``         | Normal        | Toggle diff                                      |
+-----------------------+---------------+--------------------------------------------------+
| ``Ctrl`` + ``r``      | Visual        | Replace selection                                |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``lj`` | Normal        | Next on location list                            |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``lk`` | Normal        | Previous on location list                        |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``S``  | Normal/visual | Source selection                                 |
+-----------------------+---------------+--------------------------------------------------+
| ``<leader>`` + ``ml`` | Normal        | Append modeline                                  |
+-----------------------+---------------+--------------------------------------------------+
| ``f`` + ``z``         | Normal        | Focus the current fold by closing all others     |
+-----------------------+---------------+--------------------------------------------------+

Window Management
-----------------

+--------------------------+--------+-------------------------------------+
| Key                      | Mode   | Action                              |
+==========================+========+=====================================+
| ``q``                    | Normal | Smart buffer close                  |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``p`` | Normal | Split nicely                        |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``v`` | Normal | :split                              |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``g`` | Normal | :vsplit                             |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``t`` | Normal | Open new tab (:tabnew)              |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``o`` | Normal | Close other windows (:only)         |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``x`` | Normal | Remove buffer, leave blank window   |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``q`` | Normal | Closes current buffer (:close)      |
+--------------------------+--------+-------------------------------------+
| ``Ctrl`` + ``w`` + ``Q`` | Normal | Removes current buffer (:bdelete)   |
+--------------------------+--------+-------------------------------------+
| ``Tab``                  | Normal | Next window or tab                  |
+--------------------------+--------+-------------------------------------+
| ``Shift`` + ``Tab``      | Normal | Previous window or tab              |
+--------------------------+--------+-------------------------------------+
| ``<leader>`` + ``sv``    | Normal | Split with previous buffer          |
+--------------------------+--------+-------------------------------------+
| ``<leader>`` + ``sg``    | Normal | Vertical split with previous buffer |
+--------------------------+--------+-------------------------------------+

Plugin: vim-commentary
----------------------

+---------+--------+-----------------+
| Key     | Mode   | Action          |
+=========+========+=================+
| ``gcc`` | Normal | Toggle comments |
+---------+--------+-----------------+
| ``gc``  | Visual | Toggle comments |
+---------+--------+-----------------+

Plugin: GitGutter
-----------------

+-----------------------+--------+-----------------------+
| Key                   | Mode   | Action                |
+=======================+========+=======================+
| ``<leader>`` + ``hj`` | Normal | Jump to next hunk     |
+-----------------------+--------+-----------------------+
| ``<leader>`` + ``hk`` | Normal | Jump to previous hunk |
+-----------------------+--------+-----------------------+
| ``<leader>`` + ``hs`` | Normal | Stage hunk            |
+-----------------------+--------+-----------------------+
| ``<leader>`` + ``hr`` | Normal | Revert hunk           |
+-----------------------+--------+-----------------------+
| ``<leader>`` + ``hp`` | Normal | Preview hunk          |
+-----------------------+--------+-----------------------+

Misc Plugins
------------

+-----------------------+--------+--------------------------+
| Key                   | Mode   | Action                   |
+=======================+========+==========================+
| ``<leader>`` + ``i``  | Normal | Toggle indentation lines |
+-----------------------+--------+--------------------------+

**Enjoy!**
