#!/usr/bin/env bash


if [[ "$1" = "--force" ]];
    then
        if [[ "$2" = "--installBrew" ]];
        then
            echo "about to install brew."
            ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
            echo "brew is now installed."
        else
            echo "assuming brew is already installed. installing formulas."
            echo "(brew isn't installed? use --installBrew as 2. parameter."
        fi
    else
        echo "you didn't force me to do it!"
        echo "i'm refusing to execute."
        exit 1
fi

echo 'time to brew!'
echo '-------------'

while read line; do brew install "$line"; done < formulas

brew linkapps

# Remove outdated versions from the cellar
#brew cleanup
