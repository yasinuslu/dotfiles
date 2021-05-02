df_require() {
  source "${DF_SRC_PATH}/platform.sh"
  source "${DF_SRC_PATH}/install_binaries.sh"
  source "${DF_SRC_PATH}/install_deps.sh"
  source "${DF_SRC_PATH}/install_fish.sh"
  source "${DF_SRC_PATH}/install_fzf.sh"
  source "${DF_SRC_PATH}/install_git_extensions.sh"
  source "${DF_SRC_PATH}/tmux/install.sh"
  source "${DF_SRC_PATH}/install_vim.sh"
  source "${DF_SRC_PATH}/install_lsd.sh"
  source "${DF_SRC_PATH}/install_bat.sh"
  source "${DF_SRC_PATH}/install_docker_tools.sh"
  source "${DF_SRC_PATH}/install_asdf.sh"
  source "${DF_SRC_PATH}/config.sh"
  source "${DF_SRC_PATH}/ensure.sh"
}

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
