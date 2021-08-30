XDG conformity
==============

VIM (Not Neovim!) looks for its configuration in the ``~/.vim`` directory.
My setup **also** supports the XDG location, ``.config/vim``. If you want to
use the XDG specification standard, add this somewhere
in your ``.profile`` or ``.bashrc``:

.. code:: sh

    # Set vimrc's location and source it on vim startup
    export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

If you're curious how it's done, see `main.vim:4-21`__

__ ./config/main.vim#L4-L21

Structure
=========

- `init.vim`_ - Sources `config/main.vim`_
- `vimrc`_ - Sources `config/main.vim`_
- `config`_ - Configuration

  - `main.vim`_ - Initialization
  - `minimal.vim`_ - Minimal setting. Good for short-term use
  - `extended.vim`_ - Further configuration
  - `bindings.vim`_ - Key bindings
  - `filetype.vim`_ - Language behavior
  - `with_plugin.vim`_ - Plugin metafile
  - `install_plugin.vim`_ - Plugin installation
  - `config_plugin.vim`_ - Plugin configurations

.. _init.vim: ./init.vim
.. _vimrc: ./vimrc
.. _config: ./config/
.. _main.vim: ./config/main.vim
.. _config/main.vim: ./config/main.vim
.. _minimal.vim: ./config/minimal.vim
.. _extended.vim: ./config/extended.vim
.. _bindings.vim: ./config/bindings.vim
.. _filetype.vim: ./config/filetype.vim
.. _with_plugin.vim: ./config/with_plugin.vim
.. _install_plugin.vim: ./config/install_plugin.vim
.. _config_plugin.vim: ./config/config_plugin.vim

Plugins
=========

Non Lazy-Loaded Plugins
-----------------------

+--------------+----------------------------------------+
| Name         | Description                            |
+==============+========================================+
| `dein`_      | Dark powered Vim/Neovim plugin manager |
+--------------+----------------------------------------+
| `lightline`_ | Simple status line                     |
+--------------+----------------------------------------+
| `zazen`_     | Minimal color scheme                   |
+--------------+----------------------------------------+

.. _dein: https://github.com/Shougo/dein.vim
.. _lightline: https://github.com/Yggdroot/indentLine
.. _zazen: https://github.com/zaki/zazen

Syntax and filetype
-------------------

+-----------------------+----------------------------------------+
| Name                  | Description                            |
+=======================+========================================+
| `vim-polyglot`_       | A good collection of syntax files      |
+-----------------------+----------------------------------------+
| `vim-rescript`_       | Official support of ReScript           |
+-----------------------+----------------------------------------+
| `committia`_          | Extra functions for git commit writing |
+-----------------------+----------------------------------------+
| `robotframework-vim`_ | Syntax file for robotframework         |
+-----------------------+----------------------------------------+
| `django`_             | Syntax file for django templates       |
+-----------------------+----------------------------------------+

.. _vim-polyglot: https://github.com/sheerun/vim-polyglot
.. _vim-rescript: https://github.com/rescript-lang/vim-rescript
.. _committia: https://github.com/rhysd/committia.vim
.. _robotframework-vim: https://github.com/mfukar/robotframework-vim
.. _django: https://github.com/vim-scripts/django.vim

Operators
---------

+-------------------+-------------------------------------------+
| Name              | Description                               |
+===================+===========================================+
| `sparkup`_        | HTML tag structure layout shortcut        |
+-------------------+-------------------------------------------+
| `vim-table-mode`_ | Help to form a table in mark-up languages |
+-------------------+-------------------------------------------+
| `caw`_            | Comment helper                            |
+-------------------+-------------------------------------------+
| `vim-sandwich`_   | Text-object enhancement                   |
+-------------------+-------------------------------------------+
| `vim-gutentags`_  | Ctag helper                               |
+-------------------+-------------------------------------------+

.. _sparkup: https://github.com/rstacruz/sparkup
.. _vim-table-mode: https://github.com/dhruvasagar/vim-table-mode
.. _caw: https://github.com/tyru/caw.vim
.. _vim-sandwich: https://github.com/machakann/vim-sandwich
.. _vim-gutentags: https://github.com/ludovicchabant/vim-gutentags

Interface
---------

+--------------------------+--------------------------------------------+
| Name                     | Description                                |
+==========================+============================================+
| `vim-signify`_           | Show VCS change sign on the side           |
+--------------------------+--------------------------------------------+
| `vim-better-whitespace`_ | Highlight and remove trailing spaces       |
+--------------------------+--------------------------------------------+
| `rainbow`_               | Parenthesis highlight                      |
+--------------------------+--------------------------------------------+
| `context_filetype`_      | Change filetype according to given pattern |
+--------------------------+--------------------------------------------+
| `indentLine`_            | Indent guide                               |
+--------------------------+--------------------------------------------+

.. _vim-signify: https://github.com/mhinz/vim-signify
.. _vim-better-whitespace: https://github.com/ntpeters/vim-better-whitespace
.. _rainbow: https://github.com/luochen1990/rainbow
.. _context_filetype: https://github.com/Shougo/context_filetype.vim
.. _indentline: https://github.com/Yggdroot/indentLine

Completion framework
--------------------

`asyncomplete`_

.. _asyncomplete: https://github.com/prabirshrestha/asyncomplete.vim

Completion source
-----------------

- `asyncomplete-buffer`_
- `tmux-complete`_
- `async`_ (Required by `tmux-complete`_)
- `asyncomplete-omni`_
- `asyncomplete-tags`_
- `asyncomplete-lsp`_

.. _asyncomplete-buffer: https://github.com/prabirshrestha/asyncomplete-buffer.vim
.. _tmux-complete: https://github.com/wellle/tmux-complete.vim
.. _async: https://github.com/prabirshrestha/async.vim
.. _vim-lsp: https://github.com/prabirshrestha/vim-lsp
.. _asyncomplete-omni: https://github.com/yami-beta/asyncomplete-omni.vim
.. _asyncomplete-tags: https://github.com/prabirshrestha/asyncomplete-tags.vim
.. _asyncomplete-lsp: https://github.com/prabirshrestha/asyncomplete-lsp.vim

LSP
---

- `vim-lsp`_
- `vim-lsp-julia`_

.. _vim-lsp: https://github.com/prabirshrestha/vim-lsp
.. _vim-lsp-julia: https://github.com/machakann/vim-lsp-julia/

Erlang-related
---------------

- `vim-erlang-omnicomplete`_
- `erlang-motions`_
- `vim-erlang-skeletons`_

.. _vim-erlang-omnicomplete: https://github.com/vim-erlang/vim-erlang-omnicomplete
.. _erlang_motions: https://github.com/vim-erlang/erlang-motions.vim
.. _vim-erlang-skeletons: https://github.com/vim-erlang/vim-erlang-skeletons


Custom Key bindings
===================

+----------+---------------+---------------------------------+
| Key      | Mode          | Action                          |
+==========+===============+=================================+
| ``,``    | Normal        | **Leader**                      |
+----------+---------------+---------------------------------+
| ``hjkl`` | Normal        | Smart cursor movements (g/hjkl) |
+----------+---------------+---------------------------------+
| ``<``    | Visual/Normal | Indent to left and re-select    |
+----------+---------------+---------------------------------+
| ``>``    | Visual/Normal | Indent to right and re-select   |
+----------+---------------+---------------------------------+

Editor UI
---------

+-----------------------+--------+------------------------------------------------+
| Key                   | Mode   | Action                                         |
+=======================+========+================================================+
| ``<leader>`` + ``ns`` | Normal | Toggle spell-checker (``:setlocal spell!``)    |
+-----------------------+--------+------------------------------------------------+
| ``<leader>`` + ``nh`` | Normal | Toggle highlighted search (``:set hlsearch!``) |
+-----------------------+--------+------------------------------------------------+

Plugin commands or shortcuts
===========================

``dein``
------

Call its functions.  For example:

To update all plugins from command line

.. code:: sh

  nvim --headless -c\
  'call dein#update()\
  | call map(dein#check_clean(), "delete(v:val, \'rf\')")\
  | call dein#recache_runtimepath()\
  | q'


``sparkup``
---------

Type in the structure (e.g. ``#header > h1``), then
press ``<C-E>`` whilst in insert mode to expand to HTML.

Pressing ``<C-n>`` will cycle through empty elements.

``vim-table-mode``
----------------

Use ``:TableModeToggle`` to turn on the plugin.

Type ``|`` to trigger. Read the document for more.

``caw``
-----

Select and ``gcc`` to toggle comment. Read document for more.

``vim-sandwich``
--------------

Select and ``sa``/``sd``/``sr`` to operate on surroundings.

Also check magic characters(``sai``/``saf``/``sat``).

Read document for more.

``indentLine``
-----------

Trigger with ``:IndentLinesToggle``

``vim-better-whitespace``
-----------------------

``<leader>`` + ``<Space>`` to remove trailing spaces.

``asyncomplete``
--------------

``<C-n>`` to see drop down. ``<C-p>`` to go up.

Read document and configuration for more

``erlang-motions``
----------------

- ``]]`` go to next function declaration

- ``[[`` previous function declaration

- ``]m`` next function clause

- ``[m`` previous function clause

- ``im``, ``am`` inside/around function clause

- ``iM``, ``aM`` inside/around function declaration

Read document for more.

``vim-erlang-skeletons``
-----------------------

- ``:ErlServer`` Loads gen_server template into current buffer.
- ``:ErlFsm`` Loads gen_fsm template into current buffer.
- ``:ErlStatem`` Loads gen_statem template into current buffer.
- ``:ErlSupervisor`` Loads supervisor template into current buffer.
- ``:ErlEvent`` Loads gen_event template into current buffer.
- ``:ErlApplication`` Loads application template into current buffer.
- ``:ErlEscript`` Loads escript template into current buffer.
- ``:ErlTemplate [arg]`` Loads [arg] template into current buffer.
