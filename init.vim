"============== General config ================

filetype on
filetype indent on
filetype plugin on

set nocompatible
set number
set tabstop=4 "set tab 4 space
set shiftround "line up indent
set shiftwidth=4 "indent size 4 set ruler "current cursor position
set expandtab "tab to space
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
set noundofile
set nowb 

"=============================================


"========== disable preview window ============

set completeopt-=preview

"=============================================

"========== filetype autocmd options =========

autocmd BufNewFile,BufRead *.md,*.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn setlocal nofoldenable

"=============================================




"============== Plugin install ===============

call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-scripts/vcscommand.vim'
Plug 'qpkorr/vim-renamer'
Plug 'chrisbra/csv.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tommcdo/vim-lion'
"Plug 'blueyed/vim-diminactive'
Plug 'elzr/vim-json'
"Plug 'Shougo/neocomplcache.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'wesleyche/SrcExpl'
Plug 'jacoborus/tender.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'skanehira/preview-markdown.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

"=============================================


"============== Mapping Function key ==========

let mapleader=","
map <F3> :SrcExplToggle<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :NERDTreeFind<CR>

map <C-s>m :SyntasticToggleMode<CR>
map <C-s>e :SyntasticCheck<CR>
map <C-s>t :call SyntasisToggleFunc()<CR>

nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap gc :bd<CR>

tnoremap <esc> <C-\><C-n>

"=============================================

"============== vim-airline ==========
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"=============================================

"============== ale ==========
let g:diminactive_enable_focus = 1
let g:neocomplcache_enable_at_startup = 1

"Ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "ignore in .gitignore

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

"SrcExpl
let g:SrcExpl_winHeight=8
let g:SrcExpl_isUpdateTags=0
let g:SrcExpl_refreshTime=100
let g:SrcExpl_pluginList=[
			\ "NERD_tree_1",
			\ "Source_Explorer"
			\]

function SyntasisToggleFunc()
	if g:syntastic_check_on_open == 1
		let g:syntastic_check_on_open = 0
	else
		let g:syntastic_check_on_open = 1
	endif
endfunction

"=============================================

"============== fzf configuration ============
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xofset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"

"=============================================

"============== language server (lsp) =======

let g:lsp_diagnostics_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> \d <plug>(lsp-definition)
    nmap <buffer> \s <plug>(lsp-document-symbol-search)
    nmap <buffer> \S <plug>(lsp-workspace-symbol-search)
    nmap <buffer> \r <plug>(lsp-references)
    nmap <buffer> \i <plug>(lsp-implementation)
    nmap <buffer> \t <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [\ <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]\ <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"=============================================

"============== asyncomplete ======
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"=============================================

"============== preview markdown option ======

let g:preview_markdown_vertical=1 "Open window vertical when value is 1

"=============================================

"============== terminal options =============

if has('nvim')
    nnoremap <C-]> :bel sp <bar> resize 13 <bar> terminal <CR> a
elseif has('gui_running')
    set termwinsize=20x0
    nnoremap <C-]> :belowright terminal <CR>
endif

"=============================================

"============== autocmd options =============

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"=============================================

"============== gui config (windows) ==========

colorscheme jellybeans
if has("gui_running")
	colorscheme jellybeans
	set guioptions=Mt

	if has("gui_gtk2")
		set guifont=Iconsolata\ 12
	elseif has("gui_win32")
		set guifont=consolas:h10:cANSI
	endif
endif

if has("win32")
	au GUIEnter * simalt ~x
endif

"=============================================
