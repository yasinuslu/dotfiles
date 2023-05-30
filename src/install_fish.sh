df_fish_clean() {
  rm -rf ${HOME}/.config/fish
  rm -rf ${HOME}/.config/fisher
}

df_fish_install_fisher() {
  #install fisher
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
}

df_fish_install_deps() {
  # echo heredoc to fish_plugins file
  cat << EOF > ${HOME}/.config/fish/fish_plugins
jorgebucaran/fisher
edc/bass
barnybug/docker-fish-completion
jethrokuan/fzf
jorgebucaran/fishopts
jorgebucaran/fish-menu
oh-my-fish/plugin-node-binpath
oh-my-fish/plugin-osx
oh-my-fish/theme-bobthefish
jhillyerd/plugin-git
evanlucas/fish-kubectl-completions
EOF

  fish -c "fisher update"
  fish -c "fisher install ${DF_PROJECT_PATH}/fish-plugin-nepjua"
}

df_install_fish() {
  ln -s ${DF_PROJECT_PATH}/ ${HOME}/.config/fish

  if [[ -f ${DF_PROJECT_PATH}/fish-plugin-nepjua/config.sh ]]; then
    . ${DF_PROJECT_PATH}/fish-plugin-nepjua/config.sh
  fi

  df_fish_clean
  df_fish_install_fisher
  df_fish_install_deps

  # add fish to /etc/shells
  if ! grep -q "$(which fish)" /etc/shells; then
    echo "$(which fish)" | sudo tee -a /etc/shells
  fi
}
