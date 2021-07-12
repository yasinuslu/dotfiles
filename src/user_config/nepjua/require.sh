df_install_nepjua_config_clean() {
  rm -f ~/.config/starship.toml
}


df_install_nepjua_config() {
  df_install_nepjua_config_clean

  ln -sf ${DF_SRC_PATH}/user_config/nepjua/starship.toml ${HOME}/.config/starship.toml
}
