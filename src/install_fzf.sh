df_install_fzf() {
  local fzf_path

  fzf_path=${HOME}/.fzf
  rm -rf "${fzf_path}*"

  git clone --depth 1 https://github.com/junegunn/fzf.git ${fzf_path}
  ${fzf_path}/install --all
}
