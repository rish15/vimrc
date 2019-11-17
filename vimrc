set tabstop=4
set nocompatible              " be iMproved, required
filetype off                  " required
set number
set relativenumber
set clipboard=unnamed
map <C-a> <esc>ggVG<CR>
map <Enter> o<ESC>
map <S-Enter> O<ESC>
set hlsearch "hightlight  search
set incsearch "match while typing
"netrw tree view configurations
"the following line sets directory view to tree
let g:netrw_liststyle = 4 
let g:netrw_browse_split = 3 
"removing the banner
let g:netrw_banner = 0
"open files in vertical split
let g:netrw_browse_split = 2 
"width of the directory browser(tree)
let g:netrw_winsize = 25 
"find file in all subdirectories of a directory
set path+=**
"set wildmenu "helps to find all files with .xx extension
"leader key
let mapleader = " "
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"path to install plugins
call vundle#begin('~/.vim/bundle/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" 			EXAMPLES
" -----------------------------------------------------------------
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub

"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" 			MY PLUGINS
" -----------------------------------------------------------------
Plugin 'mattn/emmet-vim'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'
Plugin 'herringtondarkholme/yats.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'leafgarland/typescript-vim'
Plugin 'w0rp/ale'
"----------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set mouse=c
