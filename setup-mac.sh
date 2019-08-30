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
brew install go
brew install telnet
brew install nodebrew
brew install tig
brew uninstall grep
brew install grep
brew install kubenetes-cli
brew install tfenv
brew install fish
brew install gibo
brew install ngrok
brew install minamijoyo/tfschema/tfschema

brew tap caskroom/cask
brew cask install emacs
brew cask install google-chrome
brew cask install google-hangouts
brew cask install docker
brew cask install spotify
brew cask install minikube

curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
