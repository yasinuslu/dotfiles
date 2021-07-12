df_install() {
  df_get_platform

  echo "Installing for ${DF_PLATFORM}"

  echo "Installing Dependencies"
  df_install_deps

  echo "Installing Git Extensions"
  df_install_git_extensions

  echo "Install binaries"
  df_install_binaries

  echo "Installing fish"
  df_install_fish

  echo "Installing fzf"
  df_install_fzf

  echo "Installing tmux"
  df_install_tmux

  echo "Installing vim"
  df_install_vim

  echo "Installing lsd"
  df_install_lsd

  echo "Installing bat"
  df_install_bat

  echo "Installing docker tools"
  df_install_docker_tools

  echo "Installing asdf (as in sdk manager)"
  df_install_asdf

  echo "Ensuring some defaults"
  df_ensure

  echo "Making some configurations"
  df_config
}
