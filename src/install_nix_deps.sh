df_install_nix_deps() {
  # if nix is not installed then install it
  if ! command -v nix &> /dev/null; then
    if [[ $DF_PLATFORM == 'Mac' ]]; then
      sh <(curl -L https://nixos.org/nix/install)
    else
      sh <(curl -L https://nixos.org/nix/install) --daemon
    fi
  fi
}
