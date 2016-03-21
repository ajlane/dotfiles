set nocompatible

filetype off

"
" Vundle plugin management
"

" Set runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git goodness
Plugin 'tpope/vim-fugitive'

" Glorious colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'flazz/vim-colorschemes'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Autoclose (, " etc
Plugin 'Townk/vim-autoclose'

" Handle surrounds
Plugin 'tpope/vim-surround'

" Ariline
Plugin 'bling/vim-airline'

" Vim + Clang
Plugin 'justmao945/vim-clang'
Plugin 'vhdirk/vim-cmake'

" Ctrl-P
Plugin 'kien/ctrlp.vim'

" Markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Highlight trailing space
Plugin 'ntpeters/vim-better-whitespace'

" Vim Scala
Plugin 'derekwyatt/vim-scala'

" Python yo
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'

" Ansible YAML
Plugin 'chase/vim-ansible-yaml'

" Ruby man
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()

"
" My custom vim settings
"

" Disable beeping
set noeb vb t_vb=
set t_vb=

"
" In normal mode, unmap arrow keys
"
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" Allow mouse interaction
set mouse=a

" Airline shows tabs when you have only 1 buffer open
let g:airline#extensions#tabline#enabled = 1

" Set nice font for GVim
set guifont=Source_Code_Pro:h10

" Syntax Highlighting
syntax on
set background=dark
colorscheme solarized

" Remap <leader>
let mapleader=","

" Yank(copy) to system clipboard
noremap <leader>y "+y<CR>
noremap <leader>p "+p

" Indentation based on file-type
filetype plugin indent on

" Shows autocomplete menus on commands
set wildmenu

" Bubbling (bracket matching)
nmap <C-up> [e
nmap <C-down> ]e
vmap <C-up> [egv
vmap <C-down> ]egv

" Indentation settings
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set textwidth=79
set colorcolumn=79
set wrap
set cindent
set cinoptions=h1,l1,g1,t0,i2,+2,(0,w1,W2

" Make backspace work like it should
set backspace=indent,eol,start

" Highlight current line
set cursorline

" Show line numbers
set nu

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Turn off search highlight using <leader><space>
nnoremap <leader><space> :nohlsearch<CR>

" Show matching brackets
set showmatch

" Remove gui menubar
set guioptions-=m

" Remove gui toolbar
set guioptions-=T

" Remove gui right scroll bar
set guioptions-=r

" Remove gui left scroll bar
set guioptions-=L

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" F2 saves
nmap <F2> :w<CR>
" F1 saves too because I always mash it when I go to hit <F2>
nmap <F1> :w<CR>

" Leader l for format
map <leader>l mzgg=G`z<CR>

" In python files <leader-f> checks the buffer with flake8
autocmd FileType python map <buffer> <leader>f :call Flake8()<CR>

" Control-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Build ruby
map <leader>r :!rake<CR>

" Spelling
nnoremap <leader>\ :set spell spelllang=en_gb<CR><CR>
nnoremap <leader>/ :set nospell<CR><CR>

" CMake
let g:cmake_cxx_compiler = 'clang'
let g:cmake_c_compiler = 'clang'
map <leader>b :CMake<CR>
map <leader>c :CmakeClean<CR>
