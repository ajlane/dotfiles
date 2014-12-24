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
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
" NERDTree
Plugin 'scrooloose/nerdtree'

" Super easy commenting, toggle comments etc
Plugin 'scrooloose/nerdcommenter'

" Autoclose (, " etc
Plugin 'Townk/vim-autoclose'

" Handle surrounds
Plugin 'tpope/vim-surround'

" Ariline
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required

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

" Airline shows tabs when you have only 1 buffer open
let g:airline#extensions#tabline#enabled = 1

" Set nice font for GVim
set guifont=Consolas:h10

" Syntax Highlighting
syntax on
set background=dark
colors solarized

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

" If no files are specified open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" If there are no file left open, and NerdTree is the last window, Exit Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" F2 saves
nmap <F2> :w<CR>

" F7 autoformats
map <F7> mzgg=G`z<CR>
