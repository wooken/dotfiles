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

Plug 'hecal3/vim-leader-guide'
let g:lmap = {}

let g:lmap.h = {
            \'name': 'Help',
            \'l': ['help usr_41', 'VimL'],
            \}

" Neomake
let g:lmap.m = {
            \'name': 'Neomake',
            \'c': ['lclose', 'close list of errors'],
            \'o': ['lopen', 'open list of errors'],
            \'l': ['ll', 'goto current error'],
            \'n': ['lnext', 'goto next error'],
            \'p': ['lprev', 'goto previous error'],
            \'m': ['Neomake', 'neomake'],
            \}

" vim-test
let g:lmap.t = {
            \'name': 'Testing',
            \'t': ['TestSuite', 'suite'],
            \'f': ['TestFile', 'file'],
            \}

" vim-fugitive
let g:lmap.g = {
            \'name': 'Git',
            \'b': ['Gblame', 'blame (open)'],
            \'o': ['Gblame q', 'blame (close)'],
            \}

" fzf.vim
let g:lmap.f = {
            \'name': 'Find',
            \'a': ['Ag', 'ag'],
            \'b': ['Buffers', 'buffers'],
            \'c': ['Colors', 'color schemes'],
            \'f': ['Files', 'files'],
            \'g': ['GitFiles', 'git files'],
            \}

" SimpleCompile
let g:lmap.r = {
            \'name': 'Run Program',
            \'c': ['SCCompile', 'compile'],
            \'r': ['SCCompileRun', 'run'],
            \}

let g:lmap[','] = ['N', 'previous file']
let g:lmap['.'] = ['n', 'next file']
let g:lmap['p'] = ['b#', 'previous buffer']

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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

Plug 'janko-m/vim-test'
let test#strategy = "dispatch"
let test#javascript#mocha#executable = 'npm test'

Plug 'xuhdev/SingleCompile'

Plug 'LaTeX-Box-Team/LaTeX-Box'
let g:tex_flavor='xelatex'
let g:LatexBox_latexmk_options = "-pvc -pdfps"
let g:LatexBox_latexmk_async=1          " run with vim --servername latex *.tex

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

" Activate vim-leader-guide
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :LeaderGuideVisual '<Space>'<CR>

" Activate base16-vim
let base16colorspace=256
colorscheme base16-monokai
set background=dark
