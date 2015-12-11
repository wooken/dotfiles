call plug#begin('~/.vim/bundle')

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'avakhov/vim-yaml'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Editor
syntax on
set t_Co=16
set background=dark

set showmatch               " Show matching brackets
set ignorecase              " Ignore case in search patterns
set number                  " Show line numbers
set hidden                  " Hide buffers when they are abandoned
set nobackup                " backups are stupid, use Git
set nowritebackup           " backups are stupid, use Git
set noswapfile              " swp files are stupid, use Git
set history=10000
set undolevels=1000
set wildignore=*.pyc
set pastetoggle=<F2>        " toggles auto-indent for pasting large blocks of text
set clipboard+=unnamedplus  " enable neovim always yanking to xclipboard

set showmatch               " When a bracket is inserted, briefly jump to the matching one
set hlsearch                " highlighted search
set incsearch               " search while typing

set backspace=indent,eol,start      " fix backspace
set mouse=                  " Enable mouse usage (all modes)

set smartcase               " ignore case UNLESS capital letter used
set autoindent
set smartindent
set tabstop=4               " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4            " Number of spaces to use for each step of (auto)indent
set expandtab               " Use the appropriate number of spaces to insert a <Tab>
                            " <Ctrl>-V, <Tab> for real tab
set smarttab                " When on, a <Tab> in front of a line inserts blanks
                            " according to 'shiftwidth'. 'tabstop' is used in other
                            " places. A <BS> will delete a 'shiftwidth' worth of space
                            " at the start of the line
set list
set listchars=tab:!·,trail:«

" Airline Setup {
set laststatus=2
set noshowmode
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols = {}
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" powerline symbols
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" } // Airline

" Enable markdown syntax highlighting for md files
au BufRead,BufNewFile *.md set filetype=markdown

" LaTeX-BoX
let g:tex_flavor='xelatex'
let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:LatexBox_latexmk_async=1          " run with vim --servername latex *.tex

" Rust
au Filetype rust setlocal nocindent

" Ruby
au FileType ruby setlocal shiftwidth=2 tabstop=2

" HTML
au FileType html setlocal shiftwidth=2 tabstop=2

" Macros
let mapleader=" "
map <LEADER>s :w<CR>:!./%<CR>
map <LEADER>v :w<CR>:!make clean;make;valgrind ./test<CR>
map <LEADER>o :w<CR>:!go test<CR>
map <LEADER>g :w<CR>:!go run %<CR>
map <LEADER>p :w<CR>:!python %<CR>
map <LEADER>c :w<CR>:!make clean;make;./test<CR>
map <LEADER>m :w<CR>:!make<CR>
map <LEADER>b :w<CR>:!ruby %<CR>
map <LEADER>r :w<CR>:!cargo test<CR>
map <LEADER>u :w<CR>:!cargo run<CR>
map <LEADER>x :w<CR>:!xrdb -load ~/.Xresources<CR>
map <LEADER>, :N<CR>
map <LEADER>. :n<CR>
