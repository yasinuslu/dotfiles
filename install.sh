#!/bin/sh

# update all submodules
git submodule update --init

# install zshrc with antigen
mv ~/.zshrc ~/.zshrc_old_nepjua 2>/dev/null
rm -rf .load_zshrc.zsh 2>/dev/null
echo "source `pwd`/modules/antigen/antigen.zsh" >> .load_zshrc.zsh
echo "antigen bundle `pwd`/custom" >> .load_zshrc.zsh
echo "source `pwd`/zshrc.zsh" >> .load_zshrc.zsh
ln -s `pwd`/.load_zshrc.zsh ~/.zshrc 2>/dev/null

# install nvm
mv ~/.nvm ~/.nvm_old_nepjua 2>/dev/null
ln -s `pwd`/modules/nvm ~/.nvm 2>/dev/null
# install stable node.js and make it default
source ~/.nvm/nvm.sh
nvm install stable
nvm alias default stable

# install vimrc
mv ~/.vim_runtime ~/.vim_runtime_old_nepjua 2>/dev/null
ln -s `pwd`/modules/vimrc ~/.vim_runtime 2>/dev/null
sh ~/.vim_runtime/install_awesome_vimrc.sh 2>/dev/null

# install tmuxconf
mv ~/.tmux ~/.tmux_old_nepjua 2>/dev/null
mv ~/.tmux.conf ~/.tmux.conf_old_nepjua 2>/dev/null
ln -s `pwd`/modules/tmux ~/.tmux 2>/dev/null
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf 2>/dev/null

# install powerline fonts
./modules/powerline-fonts/install.sh 2>/dev/null

# warning
echo ""
echo "Current theme is agnoster and you need to configure powerline fonts to see characters properly."
echo "see: https://github.com/powerline/fonts "
