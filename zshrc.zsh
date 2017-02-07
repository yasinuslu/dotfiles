ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${HOME}/.zshrc.local)
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # prezto options
    zgen prezto editor key-bindings 'emacs'
    zgen prezto prompt theme 'sorin'

    # prezto and modules
    zgen prezto
    zgen prezto environment
    zgen prezto terminal
    zgen prezto editor
    zgen prezto history
    zgen prezto directory
    zgen prezto spectrum
    zgen prezto utility
    zgen prezto completion
    zgen prezto archive
    zgen prezto tmux
    zgen prezto git
    zgen prezto osx
    zgen prezto node
    zgen prezto homebrew
    zgen prezto command-not-found
    zgen prezto syntax-highlighting
    zgen prezto prompt
    zgen prezto fasd
    zgen prezto autosuggestions

    zgen load horosgrisa/autoenv


    # save all to init script
    zgen save
fi

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias gst="git status"
