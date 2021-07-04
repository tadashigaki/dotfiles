#!/bin/bash
#$chmod a x setup.sh
#$./setup.sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

brew install tree
brew install wget
brew install git
brew install hub
brew install jq
brew install telnet
brew install nodebrew
brew uninstall grep
brew install grep
brew install kubectl
brew install tfenv
brew install gibo
brew install ngrok
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install mysql-client
brew install anyenv

brew cask install emacs
brew cask install google-chrome
brew cask install docker
brew cask install spotify

curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
