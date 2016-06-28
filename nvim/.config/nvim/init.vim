" Key Bindings {{{
let mapleader=" "
" Allows C-c to trigger InsertLeave
map <C-c> <ESC><ESC>
imap <C-c> <ESC><ESC>

nnoremap <leader>, :N<cr>
nnoremap <leader>. :n<cr>
" }}}
" Vim Plug Setup {{{
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
" }}}
" Plugins {{{
call plug#begin("$VIMHOME/bundle")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'bubblegum'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

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
nnoremap <leader>t :TestSuite<cr>

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

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'henrik/vim-indexed-search'

" Languages
Plug 'hynek/vim-python-pep8-indent'
Plug 'avakhov/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
call plug#end()
" }}}
" Colorscheme {{{
let base16colorspace=256
colorscheme base16-eighties
set background=dark
" }}}
" Settings {{{
set t_Co=16                 " neovim ignores this setting
if !empty(glob('/etc/arch-release'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" behavior
set nojoinspaces            " Single space when joining prose
set hidden                  " Hide buffers when they are abandoned
set nobackup                " backups are stupid, use Git
set nowritebackup           " backups are stupid, use Git
set noswapfile              " swp files are stupid, use Git
set undolevels=1000
set wildignore=*.pyc
set pastetoggle=<F2>        " toggles auto-indent for pasting large blocks of text
set clipboard+=unnamedplus  " enable neovim always yanking to xclipboard
set mouse=""                 " disable mouse
if !has('nvim')
    set autoread            " detect file changes outside of vim
    set backspace=indent,eol,start      " fix backspace
    set history=10000       " max = 10000
endif

" indentation
set tabstop=4               " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4            " Number of spaces to use for each step of (auto)indent
set expandtab               " Use the appropriate number of spaces to insert a <Tab>. <Ctrl>-V, <Tab> for real tab
set smartindent
if !has('nvim')
    set autoindent          " use indent from current line
    set smarttab            " <Tab> and <BS> uses 'shiftwidth'
endif

" search
set ignorecase              " Ignore case in search patterns
set smartcase               " ignore case UNLESS capital letter used
if !has('nvim')
    set hlsearch            " highlighted search
    set incsearch           " search while typing
endif

" UI
set showmatch               " Show matching brackets
set number                  " Show line numbers
set relativenumber          " Show relative numbers
set listchars=tab:!·,trail:«,nbsp:+
set list
if !has('nvim')
    set laststatus=2        " status line always shown
endif

" Auto resize splits
autocmd VimResized * wincmd =
" }}}
" Filetype Settings {{{
" Git
autocmd Filetype gitcommit setlocal
            \ spell
            \ textwidth=72

" Rust
autocmd FileType rust setlocal
            \ nocindent

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
" }}}
" vim: set foldmethod=marker:
