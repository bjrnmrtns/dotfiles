#!/bin/bash	

set -eu

print_error() {
    echo "ERROR"
}

trap print_error ERR

DOTFILES="$(dirname $(readlink -f $0))"

# Ubuntu 18.04 locations
VIMHOME=${HOME}/.vim
XRESOURCES=${HOME}/.Xresources

if [ ! -e ${VIMHOME} ]; then
    ln -s ${DOTFILES}/vim ${VIMHOME}
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    ln -s ${DOTFILES}/tmux/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${XRESOURCES} ]; then
    ln -s ${DOTFILES}/Xresources/gruvbox-dark.xresources ${XRESOURCES}
fi
