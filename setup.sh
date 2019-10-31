#!/bin/bash	

set -eu

print_error() {
    echo "ERROR"
}

trap print_error ERR

# This used to be $(readlink -f), but mac does not support that
# without installing coreutils. Therfore using $(pwd), which
# makes this script only callable from its directory.
DOTFILES=$(pwd)

case ${OSTYPE} in
    darwin*) echo "MacOS detected" ; MYOS=macos;;
    linux*) echo "Linux detected"; MYOS=linux;;
    *) echo "Operating system not supported"; exit 0;;
esac

# Ubuntu 18.04 locations
VIMHOME=${HOME}/.vim
XRESOURCES=${HOME}/.Xresources
LEDGERRC=${HOME}/.ledgerrc
NEOVIMCONFIG=${HOME}/.config/nvim/init.vim
NEOVIMPLUGINDIR=${HOME}/.config/nvim/pack/bjorn

if [ ${MYOS} == "macos" ]; then
    echo "MacOS specific configuration"
    # Specify the preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "./iterm2"
    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi

if [ ${MYOS} == "linux" ]; then
    echo "Linux specific configuration"
    if [ ! -e ${XRESOURCES} ]; then
        ln -s ${DOTFILES}/Xresources/gruvbox-dark.xresources ${XRESOURCES}
    fi
    sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt
fi

echo "Generic configuration"
stow zsh
if [ ! -e ${VIMHOME} ]; then
    ln -s ${DOTFILES}/vim ${VIMHOME}
fi
mkdir -p ${NEOVIMPLUGINDIR}
if [ ! -e ${NEOVIMPLUGINDIR}/start ]; then
    ln -s ${DOTFILES}/vim/bundle ${NEOVIMPLUGINDIR}/start
fi
if [ ! -e ${NEOVIMCONFIG} ]; then
    ln -s ${DOTFILES}/neovim/init.vim ${NEOVIMCONFIG}
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    ln -s ${DOTFILES}/tmux/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${LEDGERRC} ]; then
    ln -s ${DOTFILES}/ledger/ledgerrc ${LEDGERRC}
fi

chsh -s /bin/zsh
