df_install() {
  df_get_platform

  echo "Installing for ${DF_PLATFORM}"

  echo "Installing Bashrc"
  df_install_bashrc_clean
  df_install_bashrc

  echo "Installing Dependencies"
  df_install_nix_deps

  echo "Installing Git Extensions"
  df_install_git_extensions

  echo "Install binaries"
  df_install_binaries

  echo "Installing fish"
  df_install_fish

  echo "Installing tmux"
  df_install_tmux

  echo "Installing vim"
  df_install_vim

  echo "Installing asdf (as in sdk manager)"
  df_install_asdf
}
