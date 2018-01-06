"----------------------------------------------------------------------
" basic looks
"----------------------------------------------------------------------
set number
set numberwidth=3
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
autocmd FileType html        setlocal tabstop=2 shiftwidth=2 et
autocmd FileType css         setlocal tabstop=2 shiftwidth=2 et
autocmd FileType javascript  setlocal tabstop=2 shiftwidth=2 et
autocmd FileType go          setlocal tabstop=4 shiftwidth=4 noet

set backspace=indent,eol,start

"----------------------------------------------------------------------
" move
"----------------------------------------------------------------------
noremap 1 ^
noremap <C-j> 5j
noremap <C-k> 5k
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
autocmd QuickFixCmdPost *grep* cwindow

"----------------------------------------------------------------------
" copy
"----------------------------------------------------------------------
set clipboard=unnamed,unnamedplus
inoremap <C-v> <C-r>*
cnoremap <C-v> <C-r>*

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
set noswapfile
set noundofile

"----------------------------------------------------------------------
" encode
"----------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932,euc-jp,latin1
set fileformat=unix
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis iso2022jp
command! Sjis cp932

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
set splitbelow
set splitright
nnoremap <silent> <C-TAB> :bn<CR>
inoremap <silent> <C-TAB> <ESC>:bn<CR>
"au BufEnter * execute ':lcd ' fnameescape(expand('%:p:h'))

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
    set gfn=Ricty\ for\ Powerline:h16

elseif has('unix')
    set gfn=Ricty\ for\ Powerline\ 12

elseif has('win32') || has('win32unix')
    set guifont=Ricty_for_Powerline:h12
    set renderoptions=type:directx,renmode:5
endif

"----------------------------------------------------------------------
" gui
"----------------------------------------------------------------------
if has('gui_running')
    set guioptions-=T       "hidden toolbar
    set guioptions+=b       "display holyzon scrollbar  
    set guioptions-=m       "hidden menu bar
endif

"----------------------------------------------------------------------
" dein.vim
"----------------------------------------------------------------------
set runtimepath+=~/.vim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein.vim')
  call dein#begin('~/.vim/dein.vim')
  call dein#add('jdkanani/vim-material-theme')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('aklt/plantuml-syntax')
  call dein#add('~/.vim/hz_ja.vim', {'merged': 0})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
filetype off

"----------------------------------------------------------------------
" lightline.vim
"----------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \ }

"----------------------------------------------------------------------
" color scheme
"----------------------------------------------------------------------
syntax on
set t_Co=256
set background=dark
colorscheme material-theme

"----------------------------------------------------------------------
" macro
"----------------------------------------------------------------------
command! Xmlformat :%s/></>\r</g | :%s/$//g | filetype indent on | setf xml | normal gg=G
command! Chrome :! start chrome %

