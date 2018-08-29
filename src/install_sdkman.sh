df_install_sdkman() {
  rm -rf ${HOME}/.sdkman
  curl -s "https://get.sdkman.io" | bash
}