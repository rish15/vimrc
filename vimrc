"		
"        (_)                           
"__   __  _   _ __ ___    _ __    ___  
"\ \ / / | | | '_ ` _ \  | '__|  / __| 
" \ V /  | | | | | | | | | |    | (__  
"  \_/   |_| |_| |_| |_| |_|     \___| 
                                      
                                      

"		SET 
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set nocompatible              " be iMproved, required
set autoindent
set encoding=UTF-8
set number
set relativenumber
set nrformats=
set clipboard=unnamed
set linebreak    "Wrap lines at convenient points
set hlsearch	 "hightlight  search
set incsearch 	 "match while typing
set showtabline=2
colorscheme  pablo
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
set noshowmode "do not show --Insert-- and other modes 
"		MAPPING
map <Enter> o<ESC>
map <S-Enter> O<ESC>
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
"find file in all subdirectories of a directory
set path+=**
"set wildmenu "helps to find all files with .xx extension
"leader key
let mapleader = " "
filetype plugin indent on
syntax on
set clipboard=unnamedplus 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"path to install plugins
call vundle#begin('~/.vim/bundle/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" 			MY PLUGINS
" -----------------------------------------------------------------
Plugin 'mattn/emmet-vim'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'itchyny/lightline.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'gregsexton/MatchTag'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/goyo.vim'
call vundle#end()            " required
"----------------------------------------------------------------
filetype plugin indent on    " required

"================NERDTREE CONFIG===================
autocmd vimenter * NERDTree 												
map <C-n> :NERDTreeToggle<CR>													 
let g:NERDTreeDirArrowExpandable = '|'
let g:NERDTreeDirArrowCollapsible = '|'
"minimal UI for NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows =0 
let NERDTreeShowHidden =1
let g:NERDTreeWinSize=25
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"================ STATUS LINE CONFIG================
"THEME FOR STATUS LINE
let g:lightline = {
      \ 'colorscheme': 'materia',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
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
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


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
imap <c-p> <esc>:FZF <cr>
"open vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
"disable arrow key
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
