# Vim configuration

Lean mean Vim/Neovim machine, ~40ms startup time.

Best with Neovim or Vim 7.4+ with +lua +python extensions enabled.

## Features

- Neovim-centric
- Fast startup time
- Robust, yet light weight
- Lazy-load 90% of plugins with [dein]
- Modular configuration
- Extensive ``deoplete`` and ``neocomplete`` setup
- Lightweight simple status
- Easy customizable theme
- Premium color-schemes

## Install
If you are using Neovim, clone with:
```sh
mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
git clone git@github.com:r2qokk/vim-config.git "${XDG_CONFIG_HOME:=$HOME/.config}/nvim"
```

Or, if you are using Vim:
```sh
git clone git@github.com:r2qokk/vim-config.git ~/.vim
```

Once cloned,

1. Enter the directory you've cloned into
2. Run `make test` to make sure you have required dependencies
3. Run `make`
4. That's it! Start `nvim` or `vim`.

## Upgrade

Run `make update`

## XDG conformity

VIM (Not Neovim!) looks for its configuration in the `~/.vim` directory.
My setup **also** supports the XDG location, `.config/vim`. If you want to
use the XDG specification standard, add this somewhere
in your `.profile` or `.bashrc`:
```sh
# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
```

If you're curious how it's done, see [vimrc:13-20](./config/vimrc#L13-L20)
and [init.vim:33-46](./config/init.vim#L33-L46).

## Structure
- [config](./config)/ - Configuration
  - [plugins](./config/plugins)/ - Plugin configurations
  - [bindings.vim](./config/bindings.vim) - Key bindings
  - [filetype.vim](./config/filetype.vim) - Language behavior
  - [general.vim](./config/general.vim) - General configuration
  - [init.vim](./config/init.vim) - `runtimepath` initialization
  - [neovim.vim](./config/neovim.vim) - Neovim specific setup
  - [plugins.vim](./config/plugins.vim) - Plugin bundles
  - [terminal.vim](./config/terminal.vim) - Terminal configuration
  - [theme.vim](./config/theme.vim) - Color-scheme and theme setup
  - [utils.vim](./config/utils.vim) - Commands and functions
  - [vimrc](./config/vimrc) - Initialization
- [ftplugin](./ftplugin)/ - Language specific custom settings
- [init.vim](./init.vim) - Sources `config/vimrc`
- [vimrc](./vimrc) - Sources `config/vimrc`

## Plugin Highlights

- Package management with caching enabled and lazy loading
- Project-aware tabs and label
- PHP completion, indent, folds, syntax
- Languages: Ansible, css3, csv, json, less, markdown, mustache
- Helpers: Undo tree, bookmarks, git, tmux navigation,
    hex editor, sessions, and much more.

_Note_ that 90% of the plugins are **[lazy-loaded]**.
[lazy-loaded]: ./config/plugins.vim

## Non Lazy-Loaded Plugins

Name           | Description
-------------- | ----------------------
[dein] | Dark powered Vim/Neovim plugin manager
[vimproc] | Interactive command execution
[colorschemes] | Awesome color-schemes
[cursorword] | Underlines word under cursor
[gitbranch] | Lightweight git branch detection
[vim-parenmatch] | Intelligent pair matching

## Lazy-Loaded Plugins

### Language
Mainly use [polyglot]

Name           | Description
-------------- | ----------------------
[mustache] | Mustache and handlebars syntax
[jinja] | Jinja support in vim
[css3-syntax] | CSS3 syntax support to vim's built-in `syntax/css.vim`
[csv] | Handling column separated data
[i3] | i3 window manager config syntax
[portfile] | Macports portfile configuration files

### Commands
Name           | Description
-------------- | ----------------------
[vim-commentary] | Robust commenting
[gita] | An awesome git handling plugin
[undotree] | Ultimate undo history visualizer
[incsearch] | Improved incremental searching
[expand-region] | Visually select increasingly larger regions of text
[prettyprint] | Pretty-print vim variables
[indentline] | Display vertical indention lines
[choosewin] | Choose window to use, like tmux's 'display-pane'
[nerdtree] | File browser
[vim-asterisk] | Improved wild card character
[vim-anzu] | Improved search output
[codi] | Script playground
[vim-peekaboo] | Yank management
[vim-indent] | Tab Space convert
[vim-abolish] | Replace variant of words
[neomake] | Syntax check and others
[tagbar] | Tag view


### Interface
Name | Description
-----|-------------
[lightline] | Simple status line
[vim-signature] | Bookmarks management
[indentLine] | Indent guide
[rainbow] | Parenthesis highlight
[GoldenView] | Split windows management
[vim-sneak] | Improved ``f`` and ``t``, but using ``s`` and ``S``
[committia] | Improved git commit panel
[FastFold] | Improved fold
[gitgutter] | Shows git diffs in the gutter
[vim-repeat] | Improved ``.``

### Completion
Name           | Description
-------------- | ----------------------
[delimitmate] | Insert mode auto-completion for quotes, parenthesis, brackets
[deoplete] | Neovim: Dark powered asynchronous completion framework
[neocomplete] | Next generation completion framework
[gen_tags] | Tags management
[emmet-vim] | Html, CSS, JS edit enhancement

### Operators & Text Objects
Name           | Description
-------------- | ----------------------
[operator-user] | Define your own operator easily
[operator-replace] | Operator to replace text with register content
[operator-surround] | Operator to enclose text objects
[operator-flashy] | Operator to highlight yanks
[sideways] | Move position of parameters in function declaration.
[textobj-user] | Create your own text objects
[textobj-multiblock] | Handle multiple brackets objects
[CamelCaseMotion] | Better movement in camel case names

[dein]: https://github.com/Shougo/dein.vim
[vimproc]: https://github.com/Shougo/vimproc.vim
[colorschemes]: https://github.com/rafi/awesome-vim-colorschemes
[cursorword]: https://github.com/itchyny/vim-cursorword
[gitbranch]: https://github.com/itchyny/vim-gitbranch
[gitgutter]: https://github.com/airblade/vim-gitgutter

[polyglot]: https://github.com/sheerun/vim-polyglot
[mustache]: https://github.com/mustache/vim-mustache-handlebars
[jinja]: https://github.com/mitsuhiko/vim-jinja
[css3-syntax]: https://github.com/hail2u/vim-css3-syntax
[csv]: https://github.com/chrisbra/csv.vim
[logstash]: https://github.com/robbles/logstash.vim
[i3]: https://github.com/PotatoesMaster/i3-vim-syntax
[portfile]: https://github.com/jstrater/mpvim

[vim-commentary]: https://github.com/tpope/vim-commentary
[nerdtree]: https://github.com/scrooloose/nerdtree
[gita]: https://github.com/lambdalisue/vim-gita
[vim-asterisk]: https://github.com/haya14busa/vim-asterisk
[vim-anzu]: https://github.com/osyo-manga/vim-anzu
[undotree]: https://github.com/mbbill/undotree
[incsearch]: https://github.com/haya14busa/incsearch.vim
[codi]: https://github.com/metakirby5/codi.vim
[vim-peekaboo]: https://github.com/junegunn/vim-peekaboo
[vim-indent]: https://github.com/timkendrick/vim-indent
[vim-abolish]: https://github.com/tpope/vim-abolish
[expand-region]: https://github.com/terryma/vim-expand-region
[prettyprint]: https://github.com/thinca/vim-prettyprint
[tagbar]: https://github.com/majutsushi/tagbar

[indentline]: https://github.com/Yggdroot/indentLine
[choosewin]: https://github.com/t9md/vim-choosewin
[vim-parenmatch]: https://github.com/itchyny/vim-parenmatch
[lightline]: https://github.com/itchyny/lightline.vim
[vim-signature]: https://github.com/kshenoy/vim-signature
[indentLine]: https://github.com/Yggdroot/indentLine
[rainbow]: https://github.com/luochen1990/rainbow
[GoldenView]: https://github.com/zhaocai/GoldenView.Vim
[vim-sneak]: https://github.com/justinmk/vim-sneak
[committia]: https://github.com/rhysd/committia.vim
[FastFold]: https://github.com/Konfekt/FastFold
[neomake]: https://github.com/neomake/neomake
[vim-repeat]: https://github.com/tpope/vim-repeat

[delimitmate]: https://github.com/Raimondi/delimitMate
[deoplete]: https://github.com/Shougo/deoplete.nvim
[neocomplete]: https://github.com/Shougo/neocomplete.vim
[emmet-vim]: https://github.com/mattn/emmet-vim
[gen_tags]: https://github.com/jsfaint/gen_tags.vim

[operator-user]: https://github.com/kana/vim-operator-user
[operator-replace]: https://github.com/kana/vim-operator-replace
[operator-surround]: https://github.com/rhysd/vim-operator-surround
[operator-flashy]: https://github.com/haya14busa/vim-operator-flashy
[textobj-user]: https://github.com/kana/vim-textobj-user
[textobj-multiblock]: https://github.com/osyo-manga/vim-textobj-multiblock
[CamelCaseMotion]: https://github.com/bkad/CamelCaseMotion
[sideways]: https://github.com/AndrewRadev/sideways.vim

## Custom Key bindings

Key   | Mode | Action
----- |:----:| ------------------
`Space` | Normal | **Leader**
Arrows | Normal | Resize splits (* Enable `g:elite_mode` in `.vault.vim`)
`K` | Normal | Open Zeal or Dash on many file types (except Python+Vim script)
`<leader>`+`y` | Normal/visual | Copy selection to X11 clipboard ("+y)
`Enter` | Normal | Toggle fold (za)
`hjkl` | Normal | Smart cursor movements (g/hjkl)
`Ctrl`+`f` | Normal | Smart page forward (C-f/C-d)
`Ctrl`+`b` | Normal | Smart page backwards (C-b/C-u)
`Ctrl`+`e` | Normal | Smart scroll down (3C-e/j)
`Ctrl`+`y` | Normal | Smart scroll up (3C-y/k)
`Ctrl`+`q` | Normal | `Ctrl`+`w`
`Ctrl`+`x` | Normal | Switch buffer and placement
`}` | Normal | After paragraph motion go to first non-blank char (}^)
`<` | Visual/Normal | Indent to left and re-select
`>` | Visual/Normal | Indent to right and re-select
`Tab` | Visual | Indent to right and re-select
`Shift`+`Tab` | Visual | Indent to left and re-select
`gp` | Normal | Select last paste
`Q`/`gQ` | Normal | Disable EX-mode (<Nop>)
`Ctrl`+`a` | Command | Navigation in command line
`Ctrl`+`b` | Command | Move cursor backward in command line
`Ctrl`+`f` | Command | Move cursor forward in command line

### File Operations

Key   | Mode | Action
----- |:----:| ------------------
`<leader>`+`cd` | Normal | Switch to the directory of opened buffer (:cd %:p:h)
`<leader>`+`w` | Normal/visual | Write (:w)
`Ctrl`+`s` | _All_ | Write (:w)
`W!!` | Command | Write as root

### Editor UI

Key   | Mode | Action
----- |:----:| ------------------
`F2` | _All_ | Toggle paste mode
`F3` | Normal | Show highlight group that matches current cursor
`<leader>`+`ts` | Normal | Toggle spell-checker (:setlocal spell!)
`<leader>`+`tn` | Normal | Toggle line numbers (:setlocal nonumber!)
`<leader>`+`tl` | Normal | Toggle hidden characters (:setlocal nolist!)
`<leader>`+`th` | Normal | Toggle highlighted search (:set hlsearch!)
`<leader>`+`tw` | Normal | Toggle wrap (:setlocal wrap! breakindent!)
`g0` | Normal | Go to first tab (:tabfirst)
`g$` | Normal | Go to last tab (:tablast)
`gr` | Normal | Go to preview tab (:tabprevious)
`Ctrl`+`j` | Normal | Move to split below (<C-w>j)
`Ctrl`+`k` | Normal | Move to upper split (<C-w>k)
`Ctrl`+`h` | Normal | Move to left split (<C-w>h)
`Ctrl`+`l` | Normal | Move to right split (<C-w>l)
`*` | Visual | Search selection forwards
`#` | Visual | Search selection backwards
`,`+`Space` | Normal | Remove all spaces at EOL
`,`+`d` | Normal | Toggle diff
`Ctrl`+`r` | Visual | Replace selection
`<leader>`+`lj` | Normal | Next on location list
`<leader>`+`lk` | Normal | Previous on location list
`<leader>`+`S` | Normal/visual | Source selection
`<leader>`+`ml` | Normal | Append modeline
`f`+`z` | Normal | Focus the current fold by closing all others

### Window Management

Key   | Mode | Action
----- |:----:| ------------------
`q` | Normal | Smart buffer close
`Ctrl`+`w`+`p` | Normal | Split nicely
`Ctrl`+`w`+`v` | Normal | :split
`Ctrl`+`w`+`g` | Normal | :vsplit
`Ctrl`+`w`+`t` | Normal | Open new tab (:tabnew)
`Ctrl`+`w`+`o` | Normal | Close other windows (:only)
`Ctrl`+`w`+`x` | Normal | Remove buffer, leave blank window
`Ctrl`+`w`+`q` | Normal | Closes current buffer (:close)
`Ctrl`+`w`+`Q` | Normal | Removes current buffer (:bdelete)
`Tab` | Normal | Next window or tab
`Shift`+`Tab` | Normal | Previous window or tab
`<leader>`+`sv` | Normal | Split with previous buffer
`<leader>`+`sg` | Normal | Vertical split with previous buffer

### Plugin: neocomplete

Key   | Mode | Action
----- |:----:| ------------------
`Enter` | Insert | Smart snippet expansion
`Tab` | Insert/select | Smart tab movement or completion
`Ctrl`+`j/k/f/b` | Insert | Movement in popup
`Ctrl`+`g` | Insert | Undo completion
`Ctrl`+`l` | Insert | Complete common string
`Ctrl`+`o` | Insert | Expand snippet
`Ctrl`+`y` | Insert | Close pop-up
`Ctrl`+`e` | Insert | Close pop-up
`Ctrl`+`l` | Insert | Complete common string
`Ctrl`+`d` | Insert | Scroll down
`Ctrl`+`u` | Insert | Scroll up

### Plugin: vim-commentary

Key   | Mode | Action
----- |:----:| ------------------
`gcc` | Normal | Toggle comments
`gc` | Visual | Toggle comments

### Plugin: ChooseWin

Key   | Mode | Action
----- |:----:| ------------------
`-` | Normal | Choose a window to edit
`<leader>`+`-` | Normal | Switch editing window with selected

### Plugin: Bookmarks

Key   | Mode | Action
----- |:----:| ------------------
`m`+`?` | Normal | Show list of all bookmarks
`m`+`m` | Normal | Toggle bookmark in current line
`m`+`n` | Normal | Jump to next bookmark
`m`+`p` | Normal | Jump to previous bookmark
`m`+`i` | Normal | Annotate bookmark

### Plugin: GitGutter

Key   | Mode | Action
----- |:----:| ------------------
`<leader>`+`hj` | Normal | Jump to next hunk
`<leader>`+`hk` | Normal | Jump to previous hunk
`<leader>`+`hs` | Normal | Stage hunk
`<leader>`+`hr` | Normal | Revert hunk
`<leader>`+`hp` | Normal | Preview hunk

### Misc Plugins

Key   | Mode | Action
----- |:----:| ------------------
`<leader>`+`gu` | Normal | Open undo tree
`<leader>`+`i` | Normal | Toggle indentation lines

## Enjoy!
