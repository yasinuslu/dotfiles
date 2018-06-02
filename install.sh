#!/bin/bash

export PACAPT=${HOME}/.local/bin/pacapt
curl -Lo $PACAPT --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 $PACAPT

PACAPT_COMMAND="sudo ${PACAPT}"

$PACAPT_COMMAND -S tmux vim fish cmake bison


./scripts/install_fish.sh
./tmux/install.sh
./vim/install.sh

./scripts/install_fzf.sh
./scripts/install_gvm.sh

./scripts/ensure.sh
