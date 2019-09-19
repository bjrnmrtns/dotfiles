# Setup

## MacOS
Install iterm2

## Linux
Install urxvt 256 colors terminal

## General
Install zsh tmux
Run ./setup.sh from this directory.

## YouCompleteMe
cd vim/bundle/YouCompleteMe
Install python3-dev
python3 install.py --clang-completer (after you did git submodule --init --recursive)

## Todo
Fix status bar for tmux, should go to top and be configured
Check clang_complete with compile_commands generated from cmake

## Setup local icloud git-repos
ln -s ~Library/Mobile\ Documents/com~apple~CloudDocs/ icloud
mkdir ~/icloud/git-repos
Look in ~/icloud/git-repos/readme.txt for setting up a repo (local <-> remote)
