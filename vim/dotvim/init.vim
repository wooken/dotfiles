let mapleader=" "
source ~/.config/nvim/plugins.vim

" Allows C-c to trigger InsertLeave
inoremap <C-c> <ESC><ESC>

syntax on
set t_Co=16                 " neovim ignores this setting
if !empty(glob('/etc/arch-release'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if !has('nvim')
    set autoindent
    set autoread
    set backspace=indent,eol,start      " fix backspace
    set history=10000       " max = 10000
    set hlsearch            " highlighted search
    set incsearch           " search while typing
    set langnoremap
    set laststatus=2        " status line always shown
    set smarttab            " When on, a <Tab> in front of a line inserts blanks
                            " according to 'shiftwidth'. 'tabstop' is used in other
                            " places. A <BS> will delete a 'shiftwidth' worth of space
                            " at the start of the line
endif

set showmatch               " Show matching brackets
set ignorecase              " Ignore case in search patterns
set number                  " Show line numbers
set hidden                  " Hide buffers when they are abandoned
set nobackup                " backups are stupid, use Git
set nowritebackup           " backups are stupid, use Git
set noswapfile              " swp files are stupid, use Git
set undolevels=1000
set wildignore=*.pyc
set pastetoggle=<F2>        " toggles auto-indent for pasting large blocks of text
set clipboard+=unnamedplus  " enable neovim always yanking to xclipboard

set showmatch               " When a bracket is inserted, briefly jump to the matching one

set smartcase               " ignore case UNLESS capital letter used
set smartindent
set tabstop=4               " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4            " Number of spaces to use for each step of (auto)indent
set expandtab               " Use the appropriate number of spaces to insert a <Tab>
                            " <Ctrl>-V, <Tab> for real tab
set mouse=v
set listchars=tab:!·,trail:«,nbsp:+
set list

" Enable markdown syntax highlighting for md files
autocmd BufRead,BufNewFile *.md set filetype=markdown
