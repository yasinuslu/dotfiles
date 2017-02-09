# don't be a fuss zsh, just let me make my mistakes,
# if i'm gonna truncate a file with a redirection, it's gonna be my fault
setopt clobber

export PATH=${PATH}:${HOME}/.bin

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'

alias gst="git status"
alias cls="clear"
