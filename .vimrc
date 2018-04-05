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
" looks
"----------------------------------------------------------------------
set t_Co=256
set t_ut=
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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
augroup indent
    autocmd!
    autocmd FileType html        setlocal tabstop=2 shiftwidth=2 et
    autocmd FileType css         setlocal tabstop=2 shiftwidth=2 et
    autocmd FileType javascript  setlocal tabstop=2 shiftwidth=2 et
    autocmd FileType json        setlocal tabstop=2 shiftwidth=2 et
    autocmd FileType go          setlocal tabstop=4 shiftwidth=4 noet
augroup END

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
augroup grep
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

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
    set gfn=Ricty:h16

elseif has('unix')
    set gfn=Ricty\ 12

elseif has('win32') || has('win64') || has('win32unix')
    set guifont=Ricty:h12
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
" macro
"----------------------------------------------------------------------
command! Xmlformat :%s/></>\r</g | :%s/$//g | filetype indent on | setf xml | normal gg=G
command! Chrome :! start chrome %
command! CheetSheet :e ~/.cheetsheet.md
nnoremap <silent> <F1> :<C-u>e ~/.vimrc<CR>

"----------------------------------------------------------------------
" dein.vim
"----------------------------------------------------------------------
if &compatible
    set nocompatible
endif

let s:dein_dir = expand('~/.vim/dein.vim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if has('vim_starting')
    execute 'set runtimepath+=' . s:dein_repo_dir
endif

" install dein.vim if not found
if !isdirectory(s:dein_repo_dir)
    silent execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#add('jdkanani/vim-material-theme')
    call dein#add('cocopon/iceberg.vim')
    call dein#add('itchyny/lightline.vim')
    call dein#add('tpope/vim-surround')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('aklt/plantuml-syntax')
    call dein#add('dhruvasagar/vim-table-mode')
    call dein#add('mattn/sonictemplate-vim')
    call dein#add('simeji/winresizer')
    call dein#add('w0rp/ale')
    call dein#add('scrooloose/nerdtree')
    call dein#add('~/.vim/hz_ja.vim', {'merged': 0})

    call dein#end()
    call dein#save_state()
endif

" plugin install
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"----------------------------------------------------------------------
" lightline
"----------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

"----------------------------------------------------------------------
" vim-table-mode
"----------------------------------------------------------------------
nnoremap <silent> <C-t> :<C-u>TableModeToggle<CR>
let g:table_mode_corner = '|'
let g:table_mode_auto_align = 0

"----------------------------------------------------------------------
" sonictemplate-vim
"----------------------------------------------------------------------
let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

"----------------------------------------------------------------------
" winresiaer
"----------------------------------------------------------------------
let g:winresizer_vert_resize = 5
let g:winresizer_horiz_resize = 3

"----------------------------------------------------------------------
" ale
"----------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_linters = {
            \   'javascript': ['standard'],
            \}

"----------------------------------------------------------------------
" color scheme
"----------------------------------------------------------------------
set background=dark
colorscheme iceberg

