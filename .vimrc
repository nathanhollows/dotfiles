hi Normal ctermbg=none
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'RRethy/vim-illuminate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'joshdick/onedark.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim'
Plugin 'command-t'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

" Custom Config

let g:airline_powerline_fonts=1
let g:airline_theme = 'onedark'

"
" Basic Settings
"
set shell=/bin/zsh
set encoding=utf-8
set number

"
" Tab Settings
"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"
" Search Settings
"
set ignorecase
set smartcase
set wrapscan
set nohlsearch
set incsearch

noremap n nzz
noremap N Nzz

"
" Window resizing using arrow keys
"
nnoremap <silent> <Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

"
" Run files
"
nnoremap <silent> <F5> :call utils#runFile()<CR>

"
" Enable mouse and override scrolling
"
set mouse=a
map <ScrollWheelDown> <C-Y>
map <ScrollWheelUp> <C-E>

" 
" Strip trailing space on save
"
autocmd BufWritePre *.java :%s/\s\+$//e

filetype indent on
set showmatch
syntax enable
syntax on
au BufRead,BufNewFile *.volt set filetype=volt
colorscheme onedark 
set background=dark
" set termguicolors
hi Normal ctermbg=none
inoremap jj <Esc>
runtime macros/matchit.vim
map <leader>c :w! \| !~/.scripts/compiler.sh <c-r>%<CR>
map <leader>p :!zathura %:r.pdf <CR>
