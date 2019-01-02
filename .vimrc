set nocompatible              " be iMproved, required
filetype off                  " required

" Section: Plugins {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Syntax and language specific
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'ElmCast/elm-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'tpope/vim-sleuth'
Plug 'tweekmonster/django-plus.vim'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'zsh-users/zsh-syntax-highlighting'
Plug 'tomlion/vim-solidity'
Plug 'flowtype/vim-flow'

" Color Scheme
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'

" Format
Plug 'prettier/vim-prettier'

" Actual Plugs
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-bundler'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/neosnippet.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'janko-m/vim-test'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " icons for nerdtree
Plug 'embear/vim-localvimrc'
" Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'bling/vim-airline'

" Ether
Plug 'tomlion/vim-solidity'

call plug#end()
"}}}1

colorscheme nova

set tags=./tags; " Set tags directory
set encoding=UTF-8
set guifont=mononoki-Regular\ Nerd\ Font\ Complete\ Mono
" syntax on
syntax enable
filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

" Indentation
set autoindent 
set shiftwidth=2 

" Tabs
set tabstop=2
set softtabstop=2
set expandtab

" Format Options
set formatoptions=tcrq
set textwidth=80

" Show trailing whispace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set nu
" leader key
let mapleader=","

" Searching
set hlsearch
set incsearch
set smartcase

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <Leader>p :bp<CR> " ,p previous buffer
map <Leader>n :bn<CR> " ,n next buffer
map <Leader>d :bd<CR> " ,d delete buffer
nnoremap <leader>l :ls<CR>:b<space>

map <Leader>c :call <CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>

map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file

set laststatus=2

" Split resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" no arrow keys 
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" highlight current line
" set cursorline
" Highlight active column
" set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>q :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinSize = 20 
let NERDTreeQuitOnOpen = 0
let NERDTreeMapToggleBookmarks='b'
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline=1

" Ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Dispatch
autocmd FileType ruby let b:dispatch = 'rspec %'
nnoremap <F9> :Dispatch!<CR>

""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
"""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" "  Otherwise it saves it to ~/.vim/swap, ~/tmp or .

if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif

set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>
nmap <Leader><CR> :nohlsearch<cr>
set clipboard=unnamed

if has('nvim')
  let test#strategy = "neovim"
else
  let test#strategy = "dispatch"
endif
