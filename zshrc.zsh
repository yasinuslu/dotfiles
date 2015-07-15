# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  git
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply
