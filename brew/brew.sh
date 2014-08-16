#!/usr/bin/env bash


if [[ "$1" = "--force" ]];
    then
        echo "about to install brew."
        #ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        echo "brew is now installed."
    else
        echo "you didn't force me to do it!"
        echo "i'm refusing to execute."
        exit 1
fi

#echo 'time to brew!'
#
brew install ack
brew isntall coreutils
#brew isntall docker
brew isntall dsh
brew isntall findutils
#brew install git
#brew isntall libevent
#brew isntall libmagic
brew isntall macvim
#brew isntall nginx
#brew isntall node
#brew isntall openssl
#brew isntall postgresql
brew isntall pyenv
#brew isntall readline
#brew isntall s3cmd
brew isntall stow
brew isntall tree
brew isntall wget

brew linkapps

# Remove outdated versions from the cellar
# brew cleanup
