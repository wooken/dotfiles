" Key Bindings {{{
let mapleader=" "
" Allows C-c to trigger InsertLeave
map <C-c> <ESC><ESC>
imap <C-c> <ESC><ESC>

nnoremap <LEADER>, :Next<CR>
nnoremap <LEADER>. :next<CR>
" Neomake: open location window
nnoremap <LEADER>lo :lopen<CR>
" Neomake: close location window
nnoremap <LEADER>lc :lclose<CR>
" Neomake: go to current error/warning
nnoremap <LEADER>ll :ll<CR>
" Neomake: go to previous error/warning
nnoremap <LEADER>[ :lprevious<CR>
" Neomake: go to next error/warning
nnoremap <LEADER>] :lnext<CR>
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
let g:airline_mode_map = {
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ }
Plug 'vim-airline/vim-airline-themes'
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'

Plug 'benekastah/neomake'
augroup neomake_run
    autocmd!
    autocmd BufWinEnter * Neomake
    autocmd BufWritePost * Neomake
    "autocmd BufWritePost *.rs if has('nvim') | Neomake! cargo | endif
augroup END
let g:neomake_error_sign = {
            \ 'text': '',
            \ 'texthl': 'NeomakeErrorSign',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '',
            \ 'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_pep8_maker = {
            \ 'args': ['--ignore=E501'],
            \ }
" Disable rustc checker
"let g:neomake_rust_enabled_makers = []

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" FZF: Commands
nnoremap <LEADER>f :Commands<CR>

Plug 'janko-m/vim-test'
let test#strategy = "dispatch"
let test#javascript#mocha#executable = 'npm test'
" vim-test: TestSuite
nnoremap <LEADER>t :w<CR>:TestSuite<CR>

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{
            \'syntax': 'markdown',
            \'ext': '.md'
            \}]
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'henrik/vim-indexed-search'
Plug 'wooken/leaders.vim'
" leaders: ListLeaders
nnoremap <LEADER>j :ListLeaders<CR>

" Dispatch
Plug 'tpope/vim-dispatch'
" vim-dispatch: Dispatch
nnoremap <LEADER>r :w<CR>:Dispatch<CR>
" vim-dispatch: open quickfix window
nnoremap <LEADER>co :copen<CR>
" vim-dispatch: close quickfix window
nnoremap <LEADER>cc :cclose<CR>
autocmd Filetype rust let b:dispatch = 'cargo run'
autocmd Filetype python let b:dispatch = 'python %'
autocmd Filetype sh let b:dispatch = 'sh %'
autocmd Filetype ruby let b:dispatch = 'ruby %'
autocmd Filetype c let b:dispatch = 'gcc % && ./a.out'

" Languages
Plug 'hynek/vim-python-pep8-indent'
Plug 'avakhov/vim-yaml'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
call plug#end()
" }}}
" Colorscheme {{{
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" }}}
" Settings {{{
set t_Co=16                 " neovim ignores this setting
if has("termguicolors")
    set termguicolors
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
"autocmd VimResized * wincmd =
" }}}
" Filetype Settings {{{
" Git
autocmd Filetype gitcommit setlocal
            \ spell
            \ textwidth=72

" Rust
autocmd FileType rust setlocal
            \ nocindent

" Python
autocmd FileType python setlocal
            \ nosmartindent  " pep8-indent comments

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
" vim: set foldmethod=marker nofoldenable:
