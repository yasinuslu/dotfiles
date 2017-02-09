#!/bin/bash

rm -rf ${HOME}/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
${HOME}/.fzf/install --key-bindings --completion --no-update-rc
