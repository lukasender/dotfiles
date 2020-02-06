dotfiles
========

The superhero dotfiles.

THIS IS ALL VERY UNFINISHED AND NOT TESTED!
Use at your own risk.

Fresh install
-------------

Download:

    git clone https://github.com/lukasender/dotfiles.git
    cd dotfiles
    git submodule update --init --recursive

Make sure `stow` is installed (see 'brew/brew.sh'):

    ./brew/brew.sh --force 

Install. It'll use stow to install the packages (symlink) into your `$HOME` directory:

    ./bootstrap.sh --force

Clean
-----

This will remove all the packages which are installed. Be carefull though!

    ./clean.sh

Source
------

I've gathered many things from different sources.
Checkout out:
 - https://github.com/simonowendesign/dotfiles
 - https://github.com/mathiasbynens/dotfiles
 - https://github.com/paulirish/dotfiles
 - https://github.com/mfussenegger/dotfiles
 - http://net.tutsplus.com/tutorials/tools-and-tips/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles/
