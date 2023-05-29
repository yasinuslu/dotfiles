#!/bin/bash

df_install_nepjua_config_clean() {
  rm -f "${HOME}"/.config/starship.toml
  rm -f "${HOME}"/winhome
}

df_install_nepjua_config() {
  df_install_nepjua_config_clean

  ln -sf ${DF_SRC_PATH}/user_config/nepjua/starship.toml ${HOME}/.config/starship.toml

  # if on WSL, link winhome to windows home directory
  if [ "${DF_PLATFORM}" == "WSL" ]; then
    ln -s /mnt/c/Users/ayasi "${HOME}"/winhome
  fi

  if [ "${SHELL}" != "$(which fish)" ]; then
    chsh -s "$(which fish)"
  fi
}
