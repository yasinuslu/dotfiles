df_install_fzf() {
  local fzfPath

  fzfPath=${HOME}/.fzf
  rm -rf "${fzfPath}"
  rm -rf "${fzfPath}*"

  git clone --depth 1 https://github.com/junegunn/fzf.git ${fzfPath}
  ${fzfPath}/install --all
}
