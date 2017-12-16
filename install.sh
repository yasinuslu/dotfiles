#!/bin/bash

export PACAPT=${HOME}/.local/bin/pacapt
curl -Lo $PACAPT --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
chmod 755 $PACAPT

PACAPT_COMMAND=${PACAPT}

if [[ ! -z "${PACAPT_PREFIX}" ]]
then
  PACAPT_COMMAND="${PACAPT_PREFIX:-""} $PACAPT"
fi

$PACAPT_COMMAND -S tmux vim fish cmake

./scripts/install_fish.sh
./tmux/install.sh
./vim/install.sh
