df_install_asdf() {
  git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf

  mkdir -p ${HOME}/.config/fish/completions
  cp ${HOME}/.asdf/completions/asdf.fish ${HOME}/.config/fish/completions
}