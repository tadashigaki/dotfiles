#!/bin/bash

#
# install emacs packages
#

mkdir -p $HOME/.emacs.d/elpa
mkdir -p $HOME/.emacs.d/elisp

ln -sfv $HOME/dotfiles/.emacs.d/init.el $HOME/.emacs.d
ln -sfv $HOME/dotfiles/.emacs.d/Cask $HOME/.emacs.d
ln -sfv $HOME/dotfiles/.emacs.d/init_loader $HOME/.emacs.d

cask ~/.emacs.d/install
