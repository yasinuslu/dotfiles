#!/bin/sh

# update all submodules
git submodule update --init

# install zshrc with antigen
mv ~/.zshrc ~/.zshrc_old_nepjua
rm -rf .load_zshrc.zsh
echo "source `pwd`/modules/antigen/antigen.zsh" >> .load_zshrc.zsh
echo "antigen bundle `pwd`/custom" >> .load_zshrc.zsh
echo "source `pwd`/zshrc.zsh" >> .load_zshrc.zsh
ln -s `pwd`/.load_zshrc.zsh ~/.zshrc

# install vimrc
mv ~/.vim_runtime ~/.vim_runtime_old_nepjua
ln -s `pwd`/modules/vimrc ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install tmuxconf
mv ~/.tmux ~/.tmux_old_nepjua
mv ~/.tmux.conf ~/.tmux.conf_old_nepjua
ln -s `pwd`/modules/tmux ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf

# install powerline fonts
./modules/powerline-fonts/install.sh
