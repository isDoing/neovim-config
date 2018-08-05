"============== General config ================

filetype on
filetype indent on
filetype plugin on

set nocompatible
set number
set tabstop=4 "set tab 4 space
set shiftwidth=4 "indent size 4 set ruler "current cursor position
set hls "search keyword highliting set history=50
set mps+=<:> "add bracket type find bracket
set foldmethod=marker "using folder function

set showmatch "highlight matched bracket


syntax on

"=============================================

"============== Optional setting ==============

set wrap
set autoindent
set smartindent
set cindent

"=============================================


"============== Turn off swap =================

set noswapfile
set nobackup
set nowb 

"=============================================


"============== Plugin install ===============

call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-scripts/vcscommand.vim'
Plug 'mileszs/ack.vim'
Plug 'qpkorr/vim-renamer'
Plug 'chrisbra/csv.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tommcdo/vim-lion'
"Plug 'blueyed/vim-diminactive'
Plug 'elzr/vim-json'
Plug 'Shougo/neocomplcache.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'

call plug#end()

"=============================================


"============== Mapping Function key ==========

map <F5> :NERDTreeToggle<CR>

"=============================================


"============== ale ==========
let g:diminactive_enable_focus = 1
let g:neocomplcache_enable_at_startup = 1

"Ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

"Delta mate
let delimitMate_expand_cr=1

"=============================================
