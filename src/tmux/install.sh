df_install_tmux() {
  rm -rf ${HOME}/.tmux
  rm -rf ${HOME}/.tmux.conf
  rm -rf ${HOME}/.tmux.bak

  git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
  ln -sf $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
  cp $HOME/.tmux/.tmux.conf.local $HOME/.tmux.conf.local

  ln -sf ${DF_SRC_PATH}/tmux/tmux.conf ${HOME}/.tmux.nepjua.conf
  echo "source-file ${HOME}/.tmux.nepjua.conf" >>${HOME}/.tmux.conf.local

  tmux source-file ${HOME}/.tmux.conf
}
