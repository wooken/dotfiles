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

nnoremap <LEADER>lo :lopen<CR>
nnoremap <LEADER>lc :lclose<CR>
nnoremap <LEADER>ll :ll<CR>
nnoremap <LEADER>[ :lprevious<CR>
nnoremap <LEADER>] :lnext<CR>

" fix CR/LF line endings for windows files
nnoremap <LEADER>gcrlf :%s/\r//g<CR>

" redraw eliminates the 'hit enter to continue' prompt (see :h echo-redraw)
nnoremap <LEADER>md :let &conceallevel=(&conceallevel == 2) ? 0 : 2 <bar> redraw <bar> echo 'conceallevel=' . &conceallevel<CR>
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

Plug 'sheerun/vim-polyglot'
let g:haskell_classic_highlighting = 1
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2
let g:haskell_indent_let = 2
let g:haskell_indent_where = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1

Plug 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'readonly', 'filename', 'modified' ],
            \   ],
            \   'right': [
            \       [ 'searchindex' ],
            \       [ 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'fileformat', 'fileencoding', 'filetype' ],
            \   ],
            \ },
            \ 'component_function': {
            "\   'searchindex': 'SearchIndexMatches'
            \ },
            \ }

Plug 'dense-analysis/ale'
let g:ale_lint_on_text_changed="normal"
let g:ale_lint_on_insert_leave=1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" FZF: Commands
nnoremap <LEADER>f :Commands<CR>

"Plug 'wooken/vimwiki', { 'branch': 'bold_emph_fix' }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
let g:vimwiki_list = [{
            \'syntax': 'markdown',
            \'ext': '.md'
            \}]
let g:vimwiki_global_ext = 0
let g:vimwiki_autowriteall = 0

" way faster than gitgutter
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git']

Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula'}
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'google/vim-searchindex'
Plug 'Yggdroot/indentLine'

Plug 'wooken/url-ghrey-tea', {'do': ':UpdateRemotePlugins'}
nnoremap <LEADER>ggo :GHOpenUrl<CR>
nnoremap <LEADER>ggl :GHGetUrl<CR>

Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

"Plug 'ntpeters/vim-better-whitespace'
"let g:strip_max_file_size = 1000
"let g:strip_whitespace_on_save = 1
"let g:strip_only_modified_lines=1

Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 8
let $PYTHONUNBUFFERED=1
" AsyncRun: stop current job
nnoremap <LEADER>s :update<CR>:AsyncStop<CR>
" AsyncRun: toggle quickfix window
nnoremap <LEADER>c :call asyncrun#quickfix_toggle(8)<CR>
" AsyncRun: make
nnoremap <LEADER>r :update<CR>:AsyncRun -program=make<CR>
autocmd FileType rust nnoremap<buffer> <Leader>r :update<CR>:AsyncRun -program=make build<CR>
autocmd FileType python nnoremap<buffer> <Leader>r :update<CR>:AsyncRun -raw -program=make %<CR>
"autocmd FileType python nnoremap<buffer> <Leader>r :update<CR>:AsyncRun -raw -program=python %<CR>
" AsyncRun: make test
nnoremap <LEADER>t :update<CR>:AsyncRun -program=make test<CR>

Plug 'lifepillar/vim-cheat40'
let g:cheat40_use_default = 0

call plug#end()
" }}}

" Colorscheme {{{
if has("termguicolors")
    set termguicolors
endif
let base16colorspace=256    " Access colors present in 256 colorspace
set background=dark
colorscheme dracula
"colorscheme nord
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
set mouse=""                " disable mouse
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
set title                   " sets window title
if !has('nvim')
    set laststatus=2        " status line always shown
endif

" file navigation and completion
set path+=**
let g:netrw_liststyle=3

" ripgrep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case
endif

" Auto resize splits
"autocmd VimResized * wincmd =
" }}}

" Filetype Settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType haskell setlocal softtabstop=2 shiftwidth=2 makeprg=runghc\ %
    autocmd FileType sh setlocal makeprg=bash\ %
    autocmd FileType perl setlocal makeprg=perl\ %
    autocmd FileType python setlocal makeprg=python
    autocmd FileType html setlocal softtabstop=2 shiftwidth=2
    autocmd FileType xml setlocal softtabstop=2 shiftwidth=2
    autocmd FileType json setlocal softtabstop=2 shiftwidth=2
    autocmd BufEnter *.wxs set ft=xml
    autocmd FileType go setlocal noexpandtab
augroup END
" }}}

" Functions {{{

" uses google/vim-searchindex to return number of matches for lightline
" nice to have since the echo'd line sometimes gets overwritten by other plugins
function! SearchIndexMatches()
    if getfsize(expand(@%)) > 500000000
        return "[?/∞]"
    endif
    let [l:current, l:total] = searchindex#MatchCounts()
    let l:msg = '[' . l:current . '/' . l:total . ']'
    return l:msg
endfunction

" }}}

" Snippets {{{
nnoremap <LEADER>gd :read ~/.config/nvim/snippets/dumper.pl<CR>j=ip
" }}}

let s:devfile = $VIMHOME . '/dev.vim'
if filereadable(glob(s:devfile))
    execute 'source' s:devfile
endif

" vim: set foldmethod=marker nofoldenable:
