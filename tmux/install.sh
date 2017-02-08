#!/bin/bash

rm -rf ~/.tmux
rm -rf ~/.tmux.conf
git clone --recursive https://github.com/tony/tmux-config.git ~/.tmux

touch ~/tmux-config # tmux install script requires a file named tmux-config
~/.tmux/install.sh

mkdir ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -s `pwd`/tmux/tmux.conf ~/.tmux.nepjua.conf
echo "source-file ~/.tmux.nepjua.conf" >> ~/.tmux.conf

cd ~/.tmux
git submodule update --init


# cd ~/.tmux/vendor/tmux-mem-cpu-load
# cmake .
# make
