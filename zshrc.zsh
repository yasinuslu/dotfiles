# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  git
  zsh-users/zsh-syntax-highlighting
  https://github.com/tarruda/zsh-autosuggestions.git
  Tarrasch/zsh-autoenv
EOBUNDLES

source ~/.nvm/nvm.sh 2>/dev/null
nvm use --delete-prefix default --silent

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply
