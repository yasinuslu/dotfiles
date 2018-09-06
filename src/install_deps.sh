df_install_deps() {
  local pacapt

  pacapt="${HOME}/.local/bin/pacapt" 

  curl -Lo $pacapt --create-dirs https://github.com/icy/pacapt/raw/ng/pacapt
  chmod 755 $pacapt

  if [[ $DF_PLATFORM == 'Mac' ]]
  then
    $pacapt --noconfirm -S tmux vim fish
  else
    sudo $pacapt --noconfirm -S tmux vim fish
  fi
}
