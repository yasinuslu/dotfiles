df_install_nix_deps() {
  # if nix is not installed then install it
  if ! command -v nix &> /dev/null; then
    if [[ $DF_PLATFORM == 'Mac' ]]; then
      sh <(curl -L https://nixos.org/nix/install)
    else
      sh <(curl -L https://nixos.org/nix/install) --daemon
    fi
  fi

  df_install_bashrc_append 'export NIXPKGS_ALLOW_UNFREE=1'
  source "$HOME"/.bashrc

  nix profile install --impure \
    nixpkgs#jq \
    nixpkgs#git \
    nixpkgs#lsd \
    nixpkgs#bat \
    nixpkgs#fzf \
    nixpkgs#starship
}
