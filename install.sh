#!/bin/bash

export PACAPT=${HOME}/.local/bin/pacapt
curl -Lo $PACAPT --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 $PACAPT

$PACAPT -S ag fish cmake

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
./scripts/install_fish.sh
./tmux/install.sh
./vim/install.sh
