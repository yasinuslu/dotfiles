# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  git
  zsh-users/zsh-syntax-highlighting
  https://github.com/tarruda/zsh-autosuggestions.git
  Tarrasch/zsh-autoenv
EOBUNDLES

export NVM_DIR=$(readlink -f "$HOME/.nvm")
source ~/.nvm/nvm.sh

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply
