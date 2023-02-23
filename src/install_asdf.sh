df_install_asdf_plugin_version() {
  local plugin=${1}
  local version=${2}

  asdf plugin-add ${plugin}
  asdf plugin-update ${plugin}
  asdf install ${plugin} ${version}
  asdf global ${plugin} ${version}
}

df_install_asdf_node_fix_npm() {
  local curDir="${PWD}"

  for ver in ~/.asdf/installs/nodejs/*/bin; do
    cd "$ver" || exit
    if [ -f ../.npm/bin/npm ]; then
      ln -nfs ../.npm/bin/npm npm
      ln -nfs ../.npm/bin/npx npx
    fi
  done

  cd "${curDir}" || exit
}

df_install_asdf_bashrc() {
  mkdir -p ${DF_PROJECT_PATH}/.gen

  echo '' > ${DF_BASHRC_PATH}
  grep -qxF ". ${DF_BASHRC_PATH}" "${HOME}"/.bashrc || echo ". ${DF_BASHRC_PATH}" >> "${HOME}"/.bashrc

  # We want this to output variable names without expanding
  # shellcheck disable=SC2016
  {
    echo -e '\n. ${HOME}/.asdf/asdf.sh'
    echo -e '\n. ${HOME}/.asdf/completions/asdf.bash'
    echo -e '\nexport GOPATH=${HOME}/go'
    echo -e '\nexport PATH=${PATH}:${GOPATH}/bin:/snap/bin'
  } >> "${DF_BASHRC_PATH}"

  # shellcheck source=.gen/bashrc
  source "${DF_BASHRC_PATH}"
}

df_install_asdf() {
  git clone --depth 1 https://github.com/asdf-vm/asdf.git "${HOME}"/.asdf

  mkdir -p "${HOME}"/.config/fish/completions
  cp "${HOME}"/.asdf/completions/asdf.fish "${HOME}"/.config/fish/completions

  df_install_asdf_bashrc

  df_install_asdf_plugin_version java latest:adoptopenjdk-17
  echo -e '\nexport JAVA_HOME=$(asdf where java)' >> "${DF_BASHRC_PATH}"

  export NODEJS_CHECK_SIGNATURES=no
  df_install_asdf_plugin_version nodejs lts
  if [ $(id -u) -eq "0" ]; then
    npm config set user 0
    npm config set unsafe-perm true
  fi
  npm install -g --silent yarn@latest npm@latest
  df_install_asdf_node_fix_npm
  echo -e '\nexport PATH=$PATH:$(npm -g bin)' >> ${DF_BASHRC_PATH}
  echo -e '\nexport PATH=$PATH:$(yarn global bin)' >> ${DF_BASHRC_PATH}

  df_install_asdf_plugin_version golang latest
  mkdir -p ${HOME}/go/bin
  mkdir -p ${HOME}/go/src
}
