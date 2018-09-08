#!/bin/bash
ln -sfv $HOME/dotfiles/.bash_profile $HOME
ln -sfv $HOME/dotfiles/.bashrc $HOME
source $HOME/.bash_profile

# emacs
ln -sfv $HOME/dotfiles/.emacs.d $HOME
mkdir -p $HOME/.emacs.d/el-get
mkdir -p $HOME/.emacs.d/elisp
mkdir -p $HOME/.emacs.d/elpa

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
cd $HOME/.emacs.d/
cask install

# nodebrew
curl -L git.io/nodebrew | perl - setup

# gtags
apt-get install exuberant-ctags
pip install pygments
apt-get install global

# ag
apt-get install silversearcher-ag

# eslint
npm i -g eslint
ln -sfv $HOME/dotfiles/.eslintrc $HOME
