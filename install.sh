#!/bin/bash

curl -Lo ${HOME}/.local/bin/pacapt --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 ${HOME}/.local/bin/pacapt

${HOME}/.bin/pacapt -S ag fish cmake

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
./scripts/install.sh
# ./tmux/install.sh
# ./vim/install.sh

# update symlinks
# this part is seperated because you might wanna update yout symlinks
# without reinstalling modules
