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
Plugin 'flazz/vim-colorschemes'

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

" Vim Autoformat with Astyle
Plugin 'Chiel92/vim-autoformat'

" Ctrl-P
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'


" Highlight trailing space
Plugin 'ntpeters/vim-better-whitespace'

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
set guifont=Source\ Code\ Pro:h10

" Syntax Highlighting
syntax on
set background=dark
colorscheme Tomorrow-Night-Eighties

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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" F2 saves
nmap <F2> :w<CR>
" F1 saves too because I always mash it when I go to hit <F2>
nmap <F1> :w<CR>

" F7 autoformats
"map <F7> mzgg=G`z<CR>
let g:formatprg_c = "astyle"
let g:formatprg_args_c = "--style=java --indent=spaces=2 --attach-classes --attach-namespaces --attach-extern-c --indent-classes --indent-modifiers --indent-cases --indent-namespaces --indent-labels --indent-preproc-block --indent-preproc-cond --indent-preproc-define --unpad-paren --pad-oper --pad-header --align-pointer=type --align-reference=type --break-closing-brackets --break-elseifs --add-brackets --convert-tabs --max-code-length=79 --mode=c"
let g:formatprg_cpp = "astyle"
let g:formatprg_args_cpp = "--style=java --indent=spaces=2 --attach-classes --attach-namespaces --attach-extern-c --indent-classes --indent-modifiers --indent-cases --indent-namespaces --indent-labels --indent-preproc-block --indent-preproc-cond --indent-preproc-define --unpad-paren --pad-oper --pad-header --align-pointer=type --align-reference=type --break-closing-brackets --break-elseifs --add-brackets --convert-tabs --max-code-length=79"

noremap <F7> :Autoformat<CR>


" Control-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>t :Tagbar<CR>
