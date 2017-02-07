#!/bin/bash
git submodule update --init
ln -s `pwd`/zgen ${HOME}/.zgen
ln -s `pwd`/zshrc.zsh ${HOME}/.zshrc
ln -s `pwd`/zshrc.local ${HOME}/.zshrc.local
ln -s `pwd`/zpreztorc ${HOME}/.zpreztorc
