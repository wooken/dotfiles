call plug#begin('~/.vim/bundle')

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'avakhov/vim-yaml'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'hecal3/vim-leader-guide'
Plug 'janko-m/vim-test'
Plug 'jelera/vim-javascript-syntax'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Editor
syntax on
"set t_Co=16
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

" Neomake
autocmd! InsertLeave,BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_pep8_maker = {
            \ 'args': ['--ignore=E501'],
            \ }

" Macros
let mapleader=" "
"nmap <LEADER>h :map <lt>leader><CR>
" quickfix
"nmap <LEADER>qo :copen<CR>
"nmap <LEADER>qc :cclose<CR>
" vim-test
"nmap <LEADER>t :TestSuite<CR>
"nmap <LEADER>f :TestFile<CR>
" neomake
"nmap <LEADER>o :lopen<CR>
"nmap <LEADER>c :lclose<CR>
"nmap <LEADER>b :ll<CR>
"nmap <LEADER>n :lnext<CR>
"nmap <LEADER>p :lprev<CR>
"nmap <LEADER>m :Neomake<CR>
" buffers
"nmap <LEADER>, :N<CR>
"nmap <LEADER>. :n<CR>

" Allows C-c to trigger InsertLeave
inoremap <C-c> <ESC>

" Vim Leader Guide
let g:lmap = {}
let g:lmap.m = {
            \'name': 'Neomake',
            \'c': ['lclose', 'close list of errors'],
            \'o': ['lopen', 'open list of errors'],
            \'l': ['ll', 'goto current error'],
            \'n': ['lnext', 'goto next error'],
            \'p': ['lprev', 'goto previous error'],
            \'m': ['Neomake', 'neomake'],
            \}
let g:lmap.t = {
            \'name': 'Testing',
            \'t': ['TestSuite', 'suite'],
            \'f': ['TestFile', 'file'],
            \}

let g:lmap[','] = ['N', 'previous buffer']
let g:lmap['.'] = ['n', 'next buffer']

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :LeaderGuideVisual '<Space>'<CR>
