let mapleader=" "

" Allows C-c to trigger InsertLeave
map <C-c> <ESC><ESC>
imap <C-c> <ESC><ESC>

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
    set laststatus=2        " status line always shown
    set smarttab            " When on, a <Tab> in front of a line inserts blanks
                            " according to 'shiftwidth'. 'tabstop' is used in other
                            " places. A <BS> will delete a 'shiftwidth' worth of space
                            " at the start of the line
endif

set nojoinspaces            " Single space when joining prose
set showmatch               " Show matching brackets
set ignorecase              " Ignore case in search patterns
set number                  " Show line numbers
set relativenumber          " Show relative numbers
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

" Auto resize splits
autocmd VimResized * wincmd =

" Split navigation
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Git
autocmd Filetype gitcommit setlocal
            \ spell
            \ textwidth=72

" Rust
autocmd FileType rust setlocal
            \ nocindent

" Python
autocmd FileType python setlocal
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ smarttab
            \ expandtab
            \ nosmartindent

" Ruby
autocmd FileType ruby setlocal
            \ expandtab
            \ shiftwidth=2
            \ tabstop=2

" Javascript
autocmd FileType javascript setlocal
            \ shiftwidth=2
            \ tabstop=2
            \ nocindent

" Markdown
autocmd FileType markdown setlocal
            \ spell spelllang=en_ca

" HTML
autocmd FileType html setlocal
            \ shiftwidth=2
            \ tabstop=2

" Tex
autocmd FileType tex setlocal
            \ spell
            \ spelllang=en_ca

if has('nvim')
    let $VIMHOME = $HOME . '/.config/nvim'
else
    let $VIMHOME = $HOME . '/.vim'
endif

let s:plugin_manager = $VIMHOME . '/autoload/plug.vim'
let s:plugin_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
  echom 'vim-plug not found. Installing...'
  if executable('curl')
    silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' .
        \ s:plugin_url
  elseif executable('wget')
    call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
    silent exec '!wget --force-directories --no-check-certificate -O ' .
        \ s:plugin_manager . ' ' . s:plugin_url
  else
    echom 'Could not download plugin manager. No plugins were installed.'
    finish
  endif
  augroup vimplug
    autocmd!
    autocmd VimEnter * PlugInstall
  augroup END
endif

call plug#begin("$VIMHOME/bundle")
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

Plug 'benekastah/neomake'
augroup neomake_after_save
    autocmd!
    autocmd BufWritePost * Neomake
    autocmd BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
augroup END
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_python_pep8_maker = {
            \ 'args': ['--ignore=E501'],
            \ }
" Disable rustc checker
let g:neomake_rust_enabled_makers = []

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <leader>c :Commands<cr>

Plug 'janko-m/vim-test'
let test#strategy = "dispatch"
let test#javascript#mocha#executable = 'npm test'

Plug 'xuhdev/SingleCompile'
nnoremap <leader>r :SingleCompileRun<cr>

Plug 'LaTeX-Box-Team/LaTeX-Box'
let g:tex_flavor='xelatex'
let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:LatexBox_latexmk_async=1          " run with vim --servername latex *.tex

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{
            \'syntax': 'markdown',
            \'ext': '.md'
            \}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Misc
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'

" Syntax highlighting
Plug 'avakhov/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
call plug#end()

" Activate base16-vim
let base16colorspace=256
colorscheme base16-eighties
set background=dark
