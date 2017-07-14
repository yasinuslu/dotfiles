#!/bin/bash

export PACAPT=${HOME}/.local/bin/pacapt
curl -Lo $PACAPT --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 $PACAPT

$PACAPT -S tmux vim ag fish cmake

./scripts/install_fish.sh
./tmux/install.sh
./vim/install.sh
