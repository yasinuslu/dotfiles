df_install_binary() {
  local binDir

  binDir="${HOME}/.local/bin"

  local name=${1}
  local url=${2}

  local filePath="${binDir}/${name}"

  rm -rf "${filePath}"
  curl -L "${url}" -o "${filePath}"

  chmod +x ${filePath}
}

df_install_binaries() {
  df_install_binary "diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"
}
