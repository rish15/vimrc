"        _
"        (_)
"__   __  _   _ __ ___    _ __    ___
"\ \ / / | | | '_ ` _ \  | '__|  / __|
" \ V /  | | | | | | | | | |    | (__
"  \_/   |_| |_| |_| |_| |_|     \___|


"=====================GENERAL=============
autocmd BufWritePre *.* :%s/\s\+$//e
"vertical split by default

"==================SET====================
source ~/.vim/vimKeybindings.vim
let mapleader = " "
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set nocompatible            " be iMproved, required
set autoindent
set encoding=UTF-8
set nrformats=
set spell spelllang=en_us
set linebreak 				"Wrap lines at convenient points
set hlsearch	 			"hightlight  search
set incsearch 	 			"match while typing
set showtabline=3
set noshowmode 				"do not show --Insert-- and other modes
set nospell
set splitright
set diffopt+=vertical
set cursorline
set showcmd
set lazyredraw
set showmatch
"set fillchars+=vert:|
"AUTO INDENT
filetype indent on
set smartindent
autocmd BufRead,BufWritePre *.* normal gg=G
"SETTING THE UNDO FILE FOR TREE UNDO
if has('persistent_undo')      "check if your vim version supports it
	set undofile                 "turn on the feature
	set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
"=========================MAPPING==============================
map <Enter> o<ESC>
map <S-Enter> O<ESC>
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
"find file in all subdirectories of a directory
"set path+=**
"set wildmenu "helps to find all files with .xx extension
filetype plugin indent on
syntax on
set clipboard=unnamedplus
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"path to install plugins
call vundle#begin('~/.vim/bundle/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"================ MY PLUGINS========================
Plugin 'mattn/emmet-vim'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'itchyny/lightline.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'gregsexton/MatchTag'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/goyo.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'crusoexia/vim-monokai'
Plugin 'bling/vim-bufferline'

call vundle#end()            " required

"----------------------------------------------------------------
filetype plugin indent on    " required
colorscheme  monokai
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
"THEME FOR STATUS LINE
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
"================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

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

"=================CURSOR CONFIG====================
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
	au InsertEnter,InsertChange *
				\ if v:insertmode == 'i' |
				\   silent execute '!echo -ne "\e[5 q"' | redraw! |
				\ elseif v:insertmode == 'r' |
				\   silent execute '!echo -ne "\e[3 q"' | redraw! |
				\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

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

"===========CUSTOM KEYBINDINGS=============
"fuzzy finder
nnoremap <c-p> <esc>:FZF <cr>
"open vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>kb :tabedit  ~/.vim/vimKeybindings.vim<cr>
"source vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>c :Goyo <cr>
"delete without  yanking
vnoremap  <C-d>  "_d
"disable arrow key
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
"dsiable backspace and delete key
inoremap <BS> <Nop>
inoremap <Del> <Nop>
"delete permenently
"nnoremap dd "_dd

"Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
autocmd BufRead *.md set ft=markdown
"nnoremap <tab> <c-w>
nnoremap <tab> <c-w><c-w>
" Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
" ctags optimization
set autochdir
set tags=tags;
"delete the matching brackets
nnoremap <f4> %x``x
nnoremap <leader><leader> :nohls <cr>
nnoremap space i<space><esc>

fun! GoYCM()
	nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
	nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun
autocmd FileType * :call GoYCM()

"BUFFER LINE CONFIG
let g:bufferline_rotate = 1
"enable typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

nnoremap <leader>b <esc>:b
