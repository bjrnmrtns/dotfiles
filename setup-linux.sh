#!/bin/bash	

set -eu

print_error() {
    echo "ERROR"
}

trap print_error ERR

DOTFILES=$(readlink -f .)

# Ubuntu 18.04 locations
ZSHHOME=${HOME}/.zshrc
ALIASES=${HOME}/.aliases
VIMHOME=${HOME}/.vim


if [ ! -e ${VIMHOME} ]; then
    ln -s ${DOTFILES}/vim ${VIMHOME}
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    ln -s ${DOTFILES}/tmux/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${ZSHHOME} ]; then
    ln -s ${DOTFILES}/zsh/zshrc ${ZSHHOME}
fi
if [ ! -e ${ALIASES} ]; then
    ln -s ${DOTFILES}/zsh/aliases ${ALIASES}
fi

chsh -s /bin/zsh
