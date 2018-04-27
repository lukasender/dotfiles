#!/usr/bin/env bash

if [[ "$1" = "--force" ]];
    then
	echo "about to bootstrap."
    else
        echo "you didn't force (--force) me to do it!"
        echo "i'm refusing to execute."
        exit 1
fi

if [[ ! -d $HOME/.config/ ]]; then
    mkdir $HOME/.config
fi

stow --target=$HOME git
# stow --target=$HOME osx
stow --target=$HOME shell
stow --target=$HOME vim

if [[ ! -d $HOME/.pip_cache/ ]]; then
    mkdir $HOME/.pip_cache
fi

echo "all set and done. you're good to go! :)"
