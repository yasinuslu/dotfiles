df_clean_lsd() {
  rm -rf ${HOME}/.config/fish/completions/lsd.fish
  rm -rf ${HOME}/.local/bin/lsd
}

df_install_lsd() {

  df_clean_lsd

  local installPath
  local filePath
  local version
  local url

  installPath="${HOME}/.local/bin"
  version=$(curl -s https://api.github.com/repos/Peltoche/lsd/releases/latest | jq '.tag_name' -r)
  filePath="lsd-${version}-x86_64-unknown-linux-gnu"

  if [[ $DF_PLATFORM == 'Mac' ]]; then
    filePath="lsd-${version}-x86_64-apple-darwin"
  fi

  url="https://github.com/Peltoche/lsd/releases/download/${version}/${filePath}.tar.gz"
  curl -L "${url}" | tar -zx -C /tmp

  cp "/tmp/${filePath}/lsd" ${installPath}
  cp "/tmp/${filePath}/autocomplete/lsd.fish" "${HOME}/.config/fish/completions/"

  chmod 755 "${installPath}/lsd"

  rm -rf "/tmp/${filePath}"
}
