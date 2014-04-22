" 
" Grantus vimrc 2013
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"
" Let Vundle manage Vundle
"
Bundle 'gmarik/vundle'

"
" My bundles
"
Bundle 'derekwyatt/vim-scala'
Bundle 'derekwyatt/vim-sbt'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdtree'
Bundle 'flazz/vim-colorschemes'
Bundle 'gre/play2vim'
Bundle 'kchmck/vim-coffee-script'

"
" My settings
"
filetype plugin indent on

set cc=80
syntax enable
set background=dark
colorscheme solarized
set mouse=a
set guifont=Menlo:h12
set nu

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set hls
set incsearch

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" Open NerdTree with Control N
map <C-n> :NERDTreeToggle<CR>

" Map <F3> to clear last search
nnoremap <F3> :set hlsearch!<CR>

" Reindent entire file
map <F7> mzgg=G`z<CR>

" Use OSX tabs rather than vim ones
set guioptions+=e

" Fix airline not loading in non-split windows
set laststatus=2

" Open NerdTree in current buffer's PWD
let mapleader = ","
map <leader>r :NERDTreeFind<cr>

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Sensible Vim vimrc e
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

if &shell =~# 'fish$'
  set shell=/bin/zsh
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
