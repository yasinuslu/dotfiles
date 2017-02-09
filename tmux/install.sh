#!/bin/bash

# we need to rely on pwd for now
PROJECT_ROOT=`pwd`

rm -rf ${HOME}/.tmux
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.tmux.bak
git clone --recursive https://github.com/tony/tmux-config.git ${HOME}/.tmux

ln -sf ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf

cd ${HOME}/.tmux/vendor/tmux-mem-cpu-load && cmake . && make && sudo make install

mkdir ${HOME}/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

ln -sf ${PROJECT_ROOT}/tmux/tmux.conf ${HOME}/.tmux.nepjua.conf
echo "source-file ${HOME}/.tmux.nepjua.conf" >> ${HOME}/.tmux.conf

tmux source-file ${HOME}/.tmux.conf
