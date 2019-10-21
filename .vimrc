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

call vundle#end()
filetype plugin plugin on
filetype plugin indent on


" # powerline
set laststatus=2
set showtabline=2
set t_Co=256
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


" # vim-markdown
syntax enable


" # General
set number
set clipboard+=unnamed
set backspace=indent,eol,start
autocmd ColorScheme * highlight LineNr ctermfg=236

