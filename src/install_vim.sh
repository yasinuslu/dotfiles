df_install_vim() {
  nix profile install nixpkgs#vim

  curl -sLf https://spacevim.org/install.sh | bash
}
