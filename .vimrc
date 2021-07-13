"----------------------------------------------------------------------
" encode
"----------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,latin1
set fileformats=unix,dos,mac

"----------------------------------------------------------------------
" looks
"----------------------------------------------------------------------
set t_Co=256
set t_ut=
set t_ZH=[3m
set t_ZR=[23m
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set number
set numberwidth=3
augroup number
    autocmd!
    autocmd FileType text setlocal nonumber
augroup END
set ambiwidth=double
set nowrap

"----------------------------------------------------------------------
" indent
"----------------------------------------------------------------------
set autoindent
set smartindent
set smarttab
set expandtab

set tabstop=4
set shiftwidth=4
augroup indent
    autocmd!
    autocmd FileType txt         setlocal wrap
    autocmd FileType markdown    setlocal wrap
    autocmd FileType html        setlocal tabstop=2 shiftwidth=2
    autocmd FileType css         setlocal tabstop=2 shiftwidth=2
    autocmd FileType javascript  setlocal tabstop=2 shiftwidth=2
    autocmd FileType json        setlocal tabstop=2 shiftwidth=2
    autocmd FileType yaml        setlocal tabstop=2 shiftwidth=2
    autocmd FileType toml        setlocal tabstop=2 shiftwidth=2
    autocmd FileType go          setlocal tabstop=4 shiftwidth=4 noexpandtab
augroup END

set backspace=indent,eol,start

"----------------------------------------------------------------------
" mapleader
"----------------------------------------------------------------------
" let mapleader =","

"----------------------------------------------------------------------
" move
"----------------------------------------------------------------------
noremap 1 ^
noremap * *N
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap G Gzz
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <END>
inoremap <C-a> <HOME>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-e> <END>
cnoremap <C-a> <HOME>
set whichwrap=b,s,h,l,<,>,~,[,]

"----------------------------------------------------------------------
" scroll
"----------------------------------------------------------------------
set scrolloff=5
set sidescrolloff=0

"----------------------------------------------------------------------
" grep
"----------------------------------------------------------------------
augroup grep
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

"----------------------------------------------------------------------
" Quickfix
"----------------------------------------------------------------------
nnoremap <C-p> :cprevious<CR>
nnoremap <C-n> :cnext<CR>

"----------------------------------------------------------------------
" copy, paste
"----------------------------------------------------------------------
if has('win32') || has('win64') || has('win32unix') || has('mac')
    set clipboard=unnamed
else
    set clipboard=unnamed,unnamedplus
endif
inoremap <C-v> <C-r>*
cnoremap <C-v> <C-r>*
xnoremap p "_dP

"----------------------------------------------------------------------
" search
"----------------------------------------------------------------------
set nowrapscan
set incsearch
set hlsearch
set ignorecase
set smartcase
set noshowmatch

"----------------------------------------------------------------------
" hilight
"----------------------------------------------------------------------
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

"----------------------------------------------------------------------
" system file
"----------------------------------------------------------------------
set nobackup
"set noswapfile
set noundofile
set directory=~/.vim/tmp

"----------------------------------------------------------------------
" ime
"----------------------------------------------------------------------
set iminsert=0
set imsearch=1
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"----------------------------------------------------------------------
" buffer
"----------------------------------------------------------------------
set hidden
set autoread
set autowrite
set splitbelow
set splitright
nnoremap <silent> <C-j> :bn<CR>
nnoremap <silent> <C-k> :bp<CR>

"----------------------------------------------------------------------
" print
"----------------------------------------------------------------------
set printoptions+=left:15mm,right:10mm,top:10mm,bottom:10mm
set printoptions+=number:y
set printoptions+=syntax:a
set printoptions+=portrait:y
set printoptions+=paper:A4
set printoptions+=wrap:y

"----------------------------------------------------------------------
" statusline
"----------------------------------------------------------------------
set laststatus=2

"----------------------------------------------------------------------
" font
"----------------------------------------------------------------------
if has('mac')
    set gfn=Menlo-Regular:h14
elseif has('unix')
    set gfn=Ricty\ 12
elseif has('win32') || has('win64') || has('win32unix')
    set gfn=Ricty:h12
    set renderoptions=type:directx,renmode:5
endif

"----------------------------------------------------------------------
" bell
"----------------------------------------------------------------------
set belloff=all

"----------------------------------------------------------------------
" gui
"----------------------------------------------------------------------
if has('gui_running')
    set guioptions-=T       "hidden toolbar
    set guioptions+=b       "display holyzon scrollbar
    set guioptions-=m       "hidden menu bar
endif

"----------------------------------------------------------------------
" memo
"----------------------------------------------------------------------
autocmd BufNewFile,BufRead memo.txt $r !echo '--------------------------------------------------------------------------------' && date

"----------------------------------------------------------------------
" vim-plug
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

"Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'
Plug 'sgur/vim-editorconfig'
Plug 'itchyny/lightline.vim'
Plug 'koirand/tokyo-metro.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'

call plug#end()

"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
let NERDTreeShowHidden = 1

"----------------------------------------------------------------------
" lightline
"----------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'tokyometro',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified'],
  \   ]
  \ }
\ }

"----------------------------------------------------------------------
" color scheme
"----------------------------------------------------------------------
set background=dark
silent! colorscheme tokyo-metro
