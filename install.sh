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

df_init_paths

source "${DF_SRC_PATH}/install.sh"
df_require
df_install
