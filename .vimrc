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
let mapleader =","

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
command! Paste read !pbpaste
command! -range Copy <line1>,<line2>write !pbcopy

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
" macro
"----------------------------------------------------------------------
command! Xmlformat :%s/></>\r</g | :%s/$//g | filetype indent on | setf xml | normal gg=G
command! Chrome :! start chrome %
command! CheetSheet :e ~/.cheetsheet.md
command! Animals read!animals -a
command! Paste read!pbpaste
nnoremap <silent> <F1> :<C-u>sp ~/.vimrc<CR>

"----------------------------------------------------------------------
" vim-plug
"----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'jdkanani/vim-material-theme'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'aklt/plantuml-syntax'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mattn/sonictemplate-vim'
Plug 'simeji/winresizer'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'cocopon/pgmnt.vim'
Plug 'koirand/tokyo-metro.vim'
Plug 'pangloss/vim-javascript'

call plug#end()

"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
nnoremap <silent> <C-n> :<C-u>NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"----------------------------------------------------------------------
" lightline
"----------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'tokyometro',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified', 'ale'],
  \   ]
  \ },
  \ 'component_function': {
  \   'ale': 'ALEGetStatusLine'
  \ }
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
" vim-javascript
"----------------------------------------------------------------------
let g:javascript_plugin_flow = 1

"----------------------------------------------------------------------
" ale
"----------------------------------------------------------------------
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_fix_on_save = 1

"----------------------------------------------------------------------
" vim-go
"----------------------------------------------------------------------
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"

"----------------------------------------------------------------------
" color scheme
"----------------------------------------------------------------------
set background=dark
colorscheme tokyo-metro

