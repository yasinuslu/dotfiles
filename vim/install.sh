#!/bin/bash

CURRENT_DIR=`pwd`

# clone bare repo into cache-dir
git clone --mirror git://github.com/amix/vimrc.git ${CURRENT_DIR}/git-cache/vimrc 2>/dev/null

# remove current .vim-runtime
rm -rf ~/.vim_runtime
# clone vimrc into ~/.vim_runtime using our cache repo as reference
git clone --reference ${CURRENT_DIR}/git-cache/vimrc git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

ln -sf ${CURRENT_DIR}/vim/main.vim ~/.vim_runtime/my_configs.vim
