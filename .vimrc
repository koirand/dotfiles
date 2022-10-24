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
" set number
" set numberwidth=3
set signcolumn=yes
augroup number
    autocmd!
    autocmd FileType text setlocal nonumber
augroup END
set ambiwidth=double
set nowrap
set nolist
set listchars=tab:»-,space:･,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

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

set wildignore+=*/node_modules/*,*/.git/*

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
" set nowritebackup
"set noswapfile
set noundofile
set directory=~/.vim/tmp

"----------------------------------------------------------------------
" ime
"----------------------------------------------------------------------
set iminsert=0
set imsearch=1

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
set statusline^=%{coc#status()}

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
Plug 'sgur/vim-editorconfig'
Plug 'itchyny/lightline.vim'
Plug 'koirand/tokyo-metro.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'

call plug#end()

"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
let NERDTreeShowHidden = 1

"----------------------------------------------------------------------
" vim-terraform
"----------------------------------------------------------------------
let g:terraform_fmt_on_save = 1

"----------------------------------------------------------------------
" lightline
"----------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'tokyometro',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'relativepath', 'modified'],
  \   ]
  \ }
\ }

"----------------------------------------------------------------------
" coc-nvim
"----------------------------------------------------------------------
set updatetime=300
set shortmess+=c
set completeopt=menuone,noinsert

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"----------------------------------------------------------------------
" color scheme
"----------------------------------------------------------------------
set background=dark
silent! colorscheme tokyo-metro
