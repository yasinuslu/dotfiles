#!/bin/bash

DF_PROJECT_PATH=""
DF_SRC_PATH=""

df_init_paths() {
    DF_PROJECT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    DF_SRC_PATH="${DF_PROJECT_PATH}/src"
    DF_CACHE_PATH="${DF_PROJECT_PATH}/.cache"
}

df_init_paths

source "${DF_SRC_PATH}/install.sh"
df_install
