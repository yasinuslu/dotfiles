#!/bin/bash

mkdir -p ${HOME}/.bin
wget -O ${HOME}/.bin/pacapt \
https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 ${HOME}/.bin/pacapt

${HOME}/.bin/pacapt -S ag

# install zgen
rm -rf ${HOME}/.zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

./scripts/install_fzf.sh
./tmux/install.sh
./vim/install.sh

# update symlinks
# this part is seperated because you might wanna update yout symlinks
# without reinstalling modules
./link.sh
