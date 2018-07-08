#!/bin/bash

export PACAPT=${HOME}/.local/bin/pacapt
curl -Lo $PACAPT --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 $PACAPT

PACAPT_COMMAND="sudo ${PACAPT}"

$PACAPT_COMMAND -S tmux vim fish cmake


./scripts/install_fish.sh
./tmux/install.sh
./vim/install.sh

./scripts/install_fzf.sh
./scripts/install_sdkman.sh
./scripts/install_docker_tools.sh

./scripts/ensure.sh

read -p "Are you cool with what comes next (y/N) ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Ok, then applying extra special configurations plus ultra"
    ./scripts/config.sh
fi
