#!/bin/bash

# install zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# update symlinks
./link.sh
