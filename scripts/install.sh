#!/bin/bash

PROJECT_ROOT=`pwd`

rm -rf ${HOME}/.config/fish
rm -rf ${HOME}/.config/fisherman
rm -rf ${HOME}/.config/omf
rm -rf ${HOME}/.local/share/omf
rm -rf /tmp/install_omf.fish


# install oh-my-fish
curl -L http://get.oh-my.fish > /tmp/install_omf.fish
chmod +x /tmp/install_omf.fish
/tmp/install_omf.fish --path=${HOME}/.local/share/omf --config=${HOME}/.config/omf --noninteractive --yes
rm -rf ${HOME}/.config/omf
ln -sf ${PROJECT_ROOT}/omf ${HOME}/.config/omf

#install fisherman
curl -Lo ${HOME}/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
ln -sf ${PROJECT_ROOT}/fishfile ${HOME}/.config/fish/fishfile

fish -c "fisher"
fish -c "fisher ${PROJECT_ROOT}/fish-plugin"
fish -c "omf install"
