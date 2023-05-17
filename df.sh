#!/usr/bin/env bash

DF_PROJECT_PATH=""
DF_SRC_PATH=""
DF_BASHRC_PATH=""

df_init_paths() {
  DF_PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
  DF_SRC_PATH="${DF_PROJECT_PATH}/src"
  DF_CACHE_PATH="${DF_PROJECT_PATH}/.cache"
  DF_BASHRC_PATH="${DF_PROJECT_PATH}/.gen/bashrc"
}

df_init() {
  df_init_paths

  source "${DF_SRC_PATH}/require.sh"
  df_require
  df_get_platform
}

df_task() {
  case $1 in
  install)
    df_install
  ;;
  apply-nepjua-config)
    df_install_nepjua_config
  ;;
  dev-test-command)
    # echo $DF_PLATFORM
    df_install_bashrc
    df_install_asdf
  ;;
  *)
    echo "command not found"
  ;;
  esac
}

df_init
df_task "$@"
