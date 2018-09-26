#!/bin/bash	

set -eu

print_error() {
    echo "ERROR"
}

trap print_error ERR

DOTFILES="$(dirname $(readlink -f $0))"

# Ubuntu 18.04 locations
VIMHOME=${HOME}/.vim

ln -s ${DOTFILES}/vim ${VIMHOME}
