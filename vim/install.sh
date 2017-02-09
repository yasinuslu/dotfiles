#!/bin/bash

PROJECT_ROOT=`pwd`

# clone bare repo into cache-dir
git clone --mirror git://github.com/amix/vimrc.git ${PROJECT_ROOT}/git-cache/vimrc 2>/dev/null

# remove current .vim-runtime
rm -rf ${HOME}/.vim_runtime
# clone vimrc into ${HOME}/.vim_runtime using our cache repo as reference
git clone --reference ${PROJECT_ROOT}/git-cache/vimrc git://github.com/amix/vimrc.git ${HOME}/.vim_runtime
sh ${HOME}/.vim_runtime/install_awesome_vimrc.sh

ln -sf ${PROJECT_ROOT}/vim/main.vim ${HOME}/.vim_runtime/my_configs.vim
