"        _
"        (_)
"__   __  _   _ __ ___    _ __    ___
"\ \ / / | | | '_ ` _ \  | '__|  / __|
" \ V /  | | | | | | | | | |    | (__
"  \_/   |_| |_| |_| |_| |_|     \___|
"=====================SOURCE FILES========
source ~/.vim/cocConfig.vim
"=====================GENERAL=============
autocmd BufWritePre *.* :%s/\s\+$//e
syntax on 

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noshowmode 				"do not show --Insert-- and other modes
set showtabline=3
set wrap linebreak          "set line wrap"
set rnu
set shortmess=at            "disable welcome message"
set cursorline
call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'crusoexia/vim-monokai'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'cocopon/iceberg.vim'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} 
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
colorscheme monokai
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif
"MAPPINGS
let mapleader = " "
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"delete the matching brackets 
nnoremap <f4> %x``x 
"disable search highlig
nnoremap <leader><leader> :nohls <cr>
"insert space 
nnoremap space i<space><esc>
nnoremap <leader>ev :tabedit ~/.vim/vimrc<cr>
nnoremap <leader>c :Goyo <cr>
"switch tabs
nnoremap <tab> <c-w><c-w> 
"show undo tree
nnoremap <leader>u :UndotreeShow<cr>
"ripgrep
nnoremap <leader>ps :Rg<SPACE>

"=====================GVIM CONFIG===================

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
" open gvim in full screen mode
if has("gui_running")
	" GUI is running or is about to start.
	" Maximize gvim window.
	autocmd GUIEnter * set vb t_vb=
	set lines=999 columns=999

endif
"================EMMET config=======================
"remapping leader key
let g:user_emmet_leader_key=','
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {
			\  'javascript.jsx' : {
			\      'extends' : 'jsx',
			\  },
			\}
"================NERDTREE CONFIG===================

"autocmd vimenter * NERDTree
    autocmd VimEnter * wincmd p
    map <C-n> :NERDTreeToggle<CR>
    let g:NERDTreeDirArrowExpandable = '|'
    let g:NERDTreeDirArrowCollapsible = '|'
"minimal UI for NERDTree
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows =0
    let NERDTreeShowHidden =1
    let g:NERDTreeWinSize=30
    nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
    let g:NERDTreeWinPos = "right"

"================ STATUS LINE CONFIG================

let g:lightline = {
			\ 'colorscheme': 'monokai',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'fugitive#head',
			\	  'pwd':'!pwd'
			\ },
			\ }
set laststatus=2

"fzf config
"function! s:find_git_root()
  "return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
"endfunction

"command! ProjectFiles execute 'Files' s:find_git_root()

"map <C-p> :ProjectFiles<CR>
"jump to definition using YCM
" FZF key bindings
nnoremap <C-f> :GFiles<CR>
    let g:fzf_preview_window = ['right:30%', 'ctrl-/']
let g:fzf_layout = {'up':'30%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }
fun! GoYCM()
	nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
	nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun
autocmd FileType * :call GoYCM()

" Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost vimrc source $MYVIMRC
endif

"Auto close brackets
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

"resize split 
nnoremap <silent> <c-Up> :resize -1<CR>
nnoremap <silent> <c-Down> :resize +1<CR>
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>
"new tab 
nnoremap <C-t> :tabedit<CR>
