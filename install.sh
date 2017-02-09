#!/bin/bash

# install zgen
rm -rf ~/.zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# install fzf
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

./tmux/install.sh
./vim/install.sh


# update symlinks
# this part is seperated because you might wanna update yout symlinks
# without reinstalling modules
./link.sh
