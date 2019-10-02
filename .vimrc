" # Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" :PluginInstall
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
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
autocmd ColorScheme * highlight LineNr ctermfg=236
