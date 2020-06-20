" # Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" :PluginInstall
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin plugin on
filetype plugin indent on


" # vim-markdown
syntax enable


" # vim-airline
" :help airline
let g:airline#extensions#tabline#enabled = 1


" # General
filetype plugin indent on
set encoding=utf-8
set number
set clipboard=unnamedplus
set clipboard+=unnamed
set backspace=indent,eol,start
set shortmess+=I
autocmd ColorScheme * highlight LineNr ctermfg=236
inoremap jk <ESC>
let mapleader = " "
