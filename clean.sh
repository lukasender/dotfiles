#!/usr/bin/env bash

if [[ "$1" = "--force" ]];
    then
	echo "about to bootstrap."
    else
        echo "you didn't force (--force) me to do it!"
        echo "i'm refusing to execute."
        exit 1
fi

stow --delete git
stow --delete osx
stow --delete shell
stow --delete vim

