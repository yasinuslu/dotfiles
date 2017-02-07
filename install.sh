#!/bin/bash
git submodule update --init
ln -sf `pwd`/zgen ${HOME}/.zgen
ln -sf `pwd`/zshrc.zsh ${HOME}/.zshrc
ln -sf `pwd`/custom ${HOME}/.zsh.nepjua.custom
ln -sf `pwd`/zpreztorc ${HOME}/.zpreztorc
touch ~/.autoenv_authorized
