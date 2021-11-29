" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()

set nocompatible
filetype plugin on       " may already be in your .vimrc

let mapleader = ","
let maplocalleader = "\\"
set mouse=a

set fillchars+=vert:\ 

let g:limelight_conceal_ctermfg = 'DarkGrey'
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

let g:airline_powerline_fonts=1
let g:airline_theme='onedark'

set hidden

"
" Tab Settings
"
set tabstop=4
set shiftwidth=4
set softtabstop=4

"
" Search Settings
"
set smartcase
set wrapscan
set nohlsearch
set incsearch

" Shortcuts ---------------------- {{{
inoremap jj <esc>
nnoremap <leader><space> viw
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap H ^
nnoremap L $
nnoremap <silent> <right> <c-w>>
nnoremap <silent> <left> <c-w><
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>
noremap <F11> :Goyo<cr>
noremap n nzz
noremap N Nzz
" }}}

" Markdown file settings ---------------------- {{{
augroup md
	autocmd!
	autocmd BufRead *.md :PencilSoft
	autocmd BufRead *.md :let g:markdown_folding = 1
	autocmd FileType markdown setlocal foldlevel=99
	autocmd FileType markdown :inoremap <buffer> @@ [@]<left>
	" Around / Inside Reference ([@ref])
	autocmd FileType markdown :onoremap <buffer> ar a[
	autocmd FileType markdown :onoremap <buffer> ir i[
	" Quick reference syntax
	autocmd FileType markdown :inoremap <buffer> @@ [@]<left>
	" Inside Header (## Header)
	autocmd FileType markdown :onoremap <buffer> ih :<c-u> execute "normal! ?^#\\+\\s\r:nohlsearch\rwvg_"<cr>
	" Abbreviations
	autocmd FileType markdown :iabbrev <buffer> ARG alternate reality game
	" Todo : ir = from @ to ] OR @ to ;, for next @
augroup end
" }}}

" Writer's diet script  ---------------------- {{{
augroup diet 
	autocmd!
	" Set up highlighting groups
	autocmd FileType markdown :highlight Waste ctermfg=darkgreen guifg=darkgreen cterm=bold gui=bold
	autocmd FileType markdown :highlight Be ctermfg=darkred guifg=darkred cterm=bold gui=bold
	autocmd FileType markdown :highlight Adwords ctermfg=yellow guifg=yellow cterm=bold gui=bold
	autocmd FileType markdown :highlight Noms ctermfg=blue guifg=blue cterm=bold gui=bold
	autocmd FileType markdown :highlight Prepositions ctermfg=darkcyan guifg=darkcyan cterm=bold gui=bold
	" Set up word groups
	let wastewords = '\c\<this\>\|\<that\>\|\<there\>\|\<it\>'
	let beverbs = '\c\<be\>\|\<is\>\|\<am\>\|\<are\>\|\<was\>\|\<were\>\|\<being\>\|\<been\>'
	let prepositions = '\c\<about\>\|\<above\>\|\<across\>\|\<after\>\|\<against\>\|\<along\>\|\<among\>\|\<around\>\|\<at\>\|\<before\>\|\<behind\>\|\<below\>\|\<beneath\>\|\<beside\>\|\<between\>\|\<beyond\>\|\<by\>\|\<down\>\|\<during\>\|\<far\>\|\<from\>\|\<in\>\|\<inside\>\|\<into\>\|\<like\>\|\<near\>\|\<of\>\|\<off\>\|\<on\>\|\<onto\>\|\<out\>\|\<outside\>\|\<over\>\|\<past\>\|\<since\>\|\<through\>\|\<throughout\>\|\<till\>\|\<to\>\|\<toward\>\|\<under\>\|\<underneath\>\|\<until\>\|\<up\>\|\<upon\>\|\<with\>\|\<within\>\|\<without\>'
	let adverbs = '\c\<\w*ly\>\|\<\w*able\>\|\<\w*ac\>\|\<\w*any\>\|\<\w*al\>\|\<\w*ary\>\|\<\w*ful\>\|\<\w*ible\>\|\<\w*ic\>\|\<\w*ive\>\|\<\w*less\>\|\<\w*ly\>\|\<\w*ous\>'
	let noms = '\c\<\w*ions*\>\|\<\w*isms*\>\|\<\w*ty\>\|\<\w*ments*\>\|\<\w*ness\>\|\<\w*ance\>\|\<\w*ence\>'
	autocmd FileType markdown :noremap <buffer> <F5> :setlocal spell! spelllang=en_gb<CR>
	autocmd FileType markdown :noremap <buffer> <leader>w 
				\:let ww = matchadd("Waste", wastewords)<cr><bar>
				\:let pw = matchadd("Prepositions", prepositions)<cr><bar>
				\:let bw = matchadd("Be", beverbs)<cr><bar>
				\:let nw = matchadd("Noms", noms)<cr><bar>
				\:let aw = matchadd("Adwords", adverbs)<cr>
	autocmd FileType markdown :noremap <buffer> <leader>nw :call clearmatches()<cr>
augroup end
" }}}

" 
" Things to do:
"
" Highlight 'proven' in red (Avoid this word - Nancy)
" Highlight / autocorrect 'cross sectional' to be 'cross-sectional'
