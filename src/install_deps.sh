df_install_deps_initialize() {
  local pacapt
  local pacapt_cmd

  if [[ $DF_PLATFORM == 'Mac' ]]; then
    df_install_bashrc_append 'eval $(/opt/homebrew/bin/brew shellenv)'
    eval $(/opt/homebrew/bin/brew shellenv)
    brew update
  else
    pacapt="${HOME}/.local/bin/pacapt"
    curl -Lo $pacapt --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
    chmod 755 $pacapt
    pacapt_cmd="sudo ${pacapt} --noconfirm"
    $pacapt_cmd -Syy
  fi
}

df_install_deps_cmd() {
  local pacapt_cmd

  if [[ $DF_PLATFORM == 'Mac' ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
    brew install "$@"
  else
    pacapt_cmd="sudo \"${HOME}/.local/bin/pacapt\" --noconfirm"
    $pacapt_cmd -S "$@"
  fi
}

df_install_deps() {
  df_install_deps_initialize

  if [[ $DF_PLATFORM == 'Mac' ]]; then
    df_install_deps_cmd tmux vim fish jq git
  else
    df_install_deps_cmd tmux vim fish jq git xfonts-utils
  fi
}
