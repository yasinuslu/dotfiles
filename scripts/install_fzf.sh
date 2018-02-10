#!/bin/bash

FZF_DIR=${HOME}/.fzf

function installFzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ${FZF_DIR}
  ${FZF_DIR}/install --all
}

rm -rf ${HOME}/.fzf*
installFzf