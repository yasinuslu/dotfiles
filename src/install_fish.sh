df_fish_clean() {
  rm -rf ${HOME}/.config/fish
  rm -rf ${HOME}/.config/fisherman
  rm -rf ${HOME}/.config/omf
  rm -rf ${HOME}/.local/share/omf
  rm -rf /tmp/install_omf.fish
}

df_fish_install_omf() {
  # install oh-my-fish
  curl -L https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > /tmp/install_omf.fish
  chmod +x /tmp/install_omf.fish
  /tmp/install_omf.fish --path=${HOME}/.local/share/omf --config=${HOME}/.config/omf --noninteractive --yes
  rm -rf ${HOME}/.config/omf
  ln -sf ${DF_PROJECT_PATH}/omf ${HOME}/.config/omf
}

df_fish_install_fisherman() {
  #install fisherman
  FISHER_URL=https://raw.githubusercontent.com/fisherman/fisherman/master/fisher.fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs $FISHER_URL
  ln -sf ${DF_PROJECT_PATH}/fishfile ${HOME}/.config/fish/fishfile
}

df_fish_install_completions() {
  # install kubectl completions
  KUBECTL_COMPLETION_URL=https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/kubectl.fish
  curl -Lo ~/.config/fish/completions/kubectl.fish --create-dirs $KUBECTL_COMPLETION_URL
}

df_fish_install_deps() {
  fish -c "fisher"
  fish -c "fisher ${DF_PROJECT_PATH}/fish-plugin-nepjua"
  fish -c "omf install"
  fish -c "fnm latest"
}

df_install_fish() {
  if [[ -f ${DF_PROJECT_PATH}/fish-plugin-nepjua/config.sh ]]
  then
    . ${DF_PROJECT_PATH}/fish-plugin-nepjua/config.sh
  fi

  df_fish_clean
  df_fish_install_omf
  df_fish_install_fisherman
  df_fish_install_completions
  df_fish_install_deps
}