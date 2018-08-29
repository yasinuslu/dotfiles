df_install() {
  source "${DF_SRC_PATH}/platform.sh"
  source "${DF_SRC_PATH}/install_deps.sh"
  source "${DF_SRC_PATH}/install_fish.sh"
  source "${DF_SRC_PATH}/install_fzf.sh"
  source "${DF_SRC_PATH}/tmux/install.sh"
  source "${DF_SRC_PATH}/vim/install.sh"
  source "${DF_SRC_PATH}/install_docker_tools.sh"
  source "${DF_SRC_PATH}/install_sdkman.sh"
  source "${DF_SRC_PATH}/config.sh"
  source "${DF_SRC_PATH}/ensure.sh"

  df_get_platform

  echo "Installing for ${DF_PLATFORM}"

  echo "Installing Dependencies"
  df_install_deps

  echo "Installing fish"
  df_install_fish

  echo "Installing fzf"
  df_install_fzf

  echo "Installing tmux"
  df_install_tmux

  echo "Installing vim"
  df_install_vim

  echo "Installing sdkman"
  df_install_sdkman

  echo "Installing docker tools"
  df_install_docker_tools

  echo "Ensuring some defaults"
  df_ensure

  read -p "Do you want to get some opinionated configurations (y/N) ? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      echo "Making some configurations"
      df_config
  fi
}