df_require() {
  # @source src/require.sh
  # shellcheck source=src/require.sh

  source "${DF_SRC_PATH}/platform.sh"
  source "${DF_SRC_PATH}/install_bashrc.sh"
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
  source "${DF_SRC_PATH}/install.sh"
  source "${DF_SRC_PATH}/user_config/nepjua/require.sh"
}
