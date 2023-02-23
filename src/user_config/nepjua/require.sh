df_install_nepjua_config_clean() {
  rm -f "${HOME}"/.config/starship.toml
  rm -f "${HOME}"/winhome
}


df_install_nepjua_config() {
  df_install_nepjua_config_clean

  ln -sf ${DF_SRC_PATH}/user_config/nepjua/starship.toml ${HOME}/.config/starship.toml
  ln -s /mnt/c/Users/ayasi "${HOME}"/winhome
}
