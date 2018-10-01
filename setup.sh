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
OHMYZSHHOME=${HOME}/.oh-my-zsh
ZSHRC=${HOME}/.zshrc
ALIASES=${HOME}/.aliases

if [ ! -e ${VIMHOME} ]; then
    ln -s ${DOTFILES}/vim ${VIMHOME}
fi
if [ ! -e ${HOME}/.tmux.conf ]; then
    ln -s ${DOTFILES}/tmux/tmux.conf ${HOME}/.tmux.conf
fi
if [ ! -e ${XRESOURCES} ]; then
    ln -s ${DOTFILES}/Xresources/gruvbox-dark.xresources ${XRESOURCES}
fi
if [ ! -e ${OHMYZSHHOME} ]; then
    ln -s ${DOTFILES}/zsh/oh-my-zsh ${OHMYZSHHOME}
fi
if [ ! -e ${ZSHRC} ]; then
    ln -s ${DOTFILES}/zsh/zshrc ${ZSHRC}
fi
if [ ! -e ${ALIASES} ]; then
    ln -s ${DOTFILES}/zsh/aliases ${ALIASES}
fi

chsh -s /bin/zsh
