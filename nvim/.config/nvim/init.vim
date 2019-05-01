" Key Bindings {{{
let mapleader=" "
" Allows C-c to trigger InsertLeave
noremap <C-c> <ESC><ESC>
inoremap <C-c> <ESC><ESC>

nnoremap <leader>v :source ~/.vimrc<CR>
nnoremap <LEADER>m :make<CR>
nnoremap <LEADER>, :Next<CR>
nnoremap <LEADER>. :next<CR>
nnoremap <LEADER>j :map <lt>leader><CR>
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

Plug 'itchyny/lightline.vim'
set noshowmode
" fname function helps keep mode visible as the window shrinks
let g:lightline = {
            \ 'colorscheme': 'palenight',
            \ 'component_function': {
            \   'fname': '%<%f',
            \ },
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'filename', 'modified' ],
            \   ],
            \   'right': [
            \       [ 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'fileformat', 'fileencoding', 'filetype' ],
            \   ],
            \ },
            \ }
"let g:lightline.mode_map = {
"            \   'n': 'N',
"            \   'i' : 'I',
"            \   'R' : 'R',
"            \   'v' : 'V',
"            \   'V' : 'V',
"            \   "\<C-v>": 'V',
"            \   's' : 'S',
"            \   'S' : 'S',
"            \   "\<C-s>": 'S',
"            \ }

"Plug 'vim-airline/vim-airline'
"let g:airline_mode_map = {
"            \ 'n'  : 'N',
"            \ 'i'  : 'I',
"            \ 'R'  : 'R',
"            \ 'v'  : 'V',
"            \ 'V'  : 'V',
"            \ 's'  : 'S',
"            \ 'S'  : 'S',
"            \ }
"set noshowmode
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"
"Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme = 'dracula'

Plug 'neomake/neomake'
" neomake: open location window
nnoremap <LEADER>lo :lopen<CR>
" neomake: close location window
nnoremap <LEADER>lc :lclose<CR>
" neomake: go to current error/warning
nnoremap <LEADER>ll :ll<CR>
" neomake: go to previous error/warning
nnoremap <LEADER>[ :lprevious<CR>
" neomake: go to next error/warning
nnoremap <LEADER>] :lnext<CR>

"Plug 'w0rp/ale'
"let g:ale_lint_on_text_changed="normal"
"let g:ale_lint_on_insert_leave=1
"let g:ale_sign_error = '✖'
"let g:ale_sign_warning = '⚠'
"" ALE: open location window
"nnoremap <LEADER>lo :lopen<CR>
"" ALE: close location window
"nnoremap <LEADER>lc :lclose<CR>
"" ALE: go to current error/warning
"nnoremap <LEADER>ll :ll<CR>
"" ALE: go to previous error/warning
"nnoremap <LEADER>[ :lprevious<CR>
"" ALE: go to next error/warning
"nnoremap <LEADER>] :lnext<CR>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" FZF: Commands
nnoremap <LEADER>f :Commands<CR>

Plug 'wooken/vimwiki', { 'branch': 'bold_emph_fix' }
let g:vimwiki_list = [{
            \'syntax': 'markdown',
            \'ext': '.md'
            \}]
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
let g:vimwiki_autowriteall = 0

" way faster than gitgutter
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']

Plug 'chriskempson/base16-vim'
"Plug 'dracula/vim', { 'as': 'dracula'}
"Plug 'NLKNguyen/papercolor-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-fugitive'
Plug 'google/vim-searchindex'
Plug 'machakann/vim-sandwich'
Plug 'vim-scripts/LargeFile'

Plug 'ntpeters/vim-better-whitespace'
let g:strip_max_file_size = 1000
let g:strip_whitespace_on_save = 1
let g:strip_only_modified_lines=1
"let g:strip_whitespace_confirm=0

Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 8
let $PYTHONUNBUFFERED=1
" AsyncRun: stop current job
nnoremap <LEADER>s :w<CR>:AsyncStop<CR>
" AsyncRun: toggle quickfix window
nnoremap <LEADER>c :call asyncrun#quickfix_toggle(8)<CR>
" AsyncRun: make
nnoremap <LEADER>r :w<CR>:AsyncRun -program=make<CR>
autocmd FileType rust nnoremap<buffer> <Leader>r :w<CR>:AsyncRun -program=make build<CR>
autocmd FileType python nnoremap<buffer> <Leader>r :w<CR>:AsyncRun -raw -program=make %<CR>

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/bats.vim'

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall
let g:user_emmet_leader_key='\'

Plug 'lifepillar/vim-cheat40'
let g:cheat40_use_default = 0

call plug#end()

"Neomake
function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction
if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nrw')
endif

" }}}
" Colorscheme {{{
if has("termguicolors")
    set termguicolors
endif
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme palenight
" }}}
" Settings {{{
set t_Co=16                 " neovim ignores this setting

" GUI
set guifont=Iosevka\ Nerd\ Font\ Mono\ 12

" behavior
set undoreload=0            " clear undo tree with :edit
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
set showcmd                 " Show partial commands
set listchars=tab:!·,trail:«,nbsp:+
set list
if !has('nvim')
    set laststatus=2        " status line always shown
endif

" file navigation and completion
set path+=**
let g:netrw_liststyle=3

" Auto resize splits
"autocmd VimResized * wincmd =
" }}}
" Filetype Settings {{{
augroup filetype_vim
autocmd FileType gitcommit setlocal spell
autocmd FileType perl setlocal makeprg=perl\ %
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType xml setlocal tabstop=2 shiftwidth=2
autocmd BufEnter *.wxs set ft=xml
augroup END
" }}}

" vim: set foldmethod=marker nofoldenable:
