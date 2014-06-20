" 
" Grantus vimrc 2013
"
set nocompatible              " be iMproved, required
filetype off                  " required

"
" Vundle Start
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'Rip-Rip/clang_complete'

call vundle#end()            " required
filetype plugin indent on    " required

"
" Vundle End
"

"
" My settings
"
set cc=80
syntax enable
set mouse=a
set nu

" Tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set hls
set incsearch

set showmatch           " show matching bracket (briefly jump)
set matchtime=2         " reduces matching paren blink time from the 5[00]ms def
set showmode            " show mode in status bar (insert/replace/...)

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Open NerdTree with Control N
map <C-n> :NERDTreeToggle<CR>

" Map <F3> to clear last search
nnoremap <F3> :set hlsearch!<CR>

" Reindent entire file
map <F7> mzgg=G`z<CR>

" CLI settings
set background=dark
colorscheme base16-default

" Gooey Settings :)
if has('gui_running')
    set guifont=Source\ Code\ Pro\ 12
    set guioptions-=T               " remove the toolbar
    set guioptions=acg
    set guioptions+=e
    set lines=40                    " 40 lines of text instead of 24,
    set background=dark
    colorscheme base16-default
endif

" Astyle on Save
:autocmd BufWritePost *.c execute '!astyle' shellescape(expand('%'), 1)
:autocmd BufWritePost *.h execute '!astyle' shellescape(expand('%'), 1)
:autocmd BufWritePost *.cpp execute '!astyle' shellescape(expand('%'), 1)
:autocmd BufWritePost *.hpp execute '!astyle' shellescape(expand('%'), 1)


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

inoremap <C-U> <C-G>u<C-U>

" Disable the arrow keys to learn the hard way
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"
" Clang settings
"
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/'
