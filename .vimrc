set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Dependencies of snipmate
Plugin "MarcWeber/vim-addon-mw-utils"
Plugin "tomtom/tlib_vim"
Plugin "honza/vim-snippets"

" Snippets for use
Plugin 'garbas/vim-snipmate'

" Git tools
Plugin 'tpope/vim-fugitive'

" Rails
Plugin 'tpope/vim-rails.git'

" Vim-Ruby
Plugin 'vim-ruby/vim-ruby'

" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'

" Surround code
Plugin 'tpope/vim-surround'

" Every one should have a pair (Autogenerate pairs for "{[( )
Plugin 'jiangmiao/auto-pairs'

" Tab completions
Plugin 'ervandew/supertab'

" Fuzzy finder for vim (CTRL+P)
Plugin 'kien/ctrlp.vim'

" For tests
Plugin 'janko-m/vim-test'

" Tree Explorer
Plugin 'scrooloose/nerdtree'

" Dispatch test runner to tmux pane
Plugin 'tpope/vim-dispatch'

" Syntastic
Plugin 'scrooloose/syntastic'

" vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

" Zsh syntax highlighting
Plugin 'zsh-users/zsh-syntax-highlighting'

" vim-airline
Plugin 'bling/vim-airline'

" Tagbar
Plugin 'majutsushi/tagbar'

" NerdTree Syntax Highlight
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Icons for NerdTree
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
set expandtab
set shiftwidth=2
set softtabstop=2

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

map <Leader>c :call <CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>s :TestNearest<CR>

map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file

set laststatus=2

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
set cursorline
" Highlight active column
set cuc cul"

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
let NERDTreeQuitOnOpen = 1
let NERDTreeMapToggleBookmarks='b'
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline=1

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
