df_clean_bat() {
  rm -rf ${HOME}/.config/fish/completions/bat.fish
  rm -rf ${HOME}/.local/bin/bat
}

df_install_bat() {

  df_clean_bat

  local installPath
  local filePath
  local version
  local url

  installPath="${HOME}/.local/bin"
  version=$(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq '.tag_name' -r)
  filePath="bat-${version}-x86_64-unknown-linux-gnu"

  if [[ $DF_PLATFORM == 'Mac' ]]; then
    filePath="bat-${version}-x86_64-apple-darwin"
  fi

  url="https://github.com/sharkdp/bat/releases/download/${version}/${filePath}.tar.gz"
  curl -L "${url}" | tar -zx -C /tmp

  cp "/tmp/${filePath}/bat" ${installPath}
  cp "/tmp/${filePath}/autocomplete/bat.fish" "${HOME}/.config/fish/completions/"

  chmod 755 "${installPath}/bat"

  rm -rf "/tmp/${filePath}"
}
