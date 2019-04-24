df_install_asdf_plugin_version() {
  local plugin=${1}
  local version=${2}

  asdf plugin-add ${plugin}
  asdf install ${plugin} ${version}
  asdf global ${plugin} ${version}
}

df_install_asdf_node_fix_npm() {
  local curDir="${PWD}"

  for ver in ~/.asdf/installs/nodejs/*/bin; do
    cd $ver
    if [ -f ../.npm/bin/npm ]; then
      ln -nfs ../.npm/bin/npm npm
      ln -nfs ../.npm/bin/npx npx
    fi
  done

  cd "${curDir}"
}

df_install_asdf() {
  git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf

  mkdir -p ${HOME}/.config/fish/completions
  cp ${HOME}/.asdf/completions/asdf.fish ${HOME}/.config/fish/completions

  mkdir -p ${DF_PROJECT_PATH}/.gen

  local bashrc=${DF_PROJECT_PATH}/.gen/bashrc
  echo '' > ${bashrc}
  grep -qxF ". ${bashrc}" "${HOME}"/.bashrc || echo ". ${bashrc}" >> "${HOME}"/.bashrc

  echo -e '\n. $HOME/.asdf/asdf.sh' >> ${bashrc}
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ${bashrc}

  source ${bashrc}

  df_install_asdf_plugin_version java openjdk-11

  export NODEJS_CHECK_SIGNATURES=no
  df_install_asdf_plugin_version nodejs 10.15.3
  if [ $(id -u) -eq "0" ]; then
    npm config set user 0
    npm config set unsafe-perm true
  fi
  npm install -g --silent yarn@latest npm@latest
  df_install_asdf_node_fix_npm
  echo -e '\nexport PATH=$PATH:$(yarn global bin)' >> ${bashrc}

  df_install_asdf_plugin_version golang 1.11.2
  mkdir -p ${HOME}/go/bin
  mkdir -p ${HOME}/go/src
}
