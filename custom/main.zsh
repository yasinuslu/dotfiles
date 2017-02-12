# don't be a fuss zsh, just let me make my mistakes,
# if i'm gonna truncate a file with a redirection, it's gonna be my fault
setopt clobber

export PATH=${PATH}:${HOME}/.bin

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export EDITOR="vim"

alias gst="git status"
alias cls="clear"

export PATH=$(brew --prefix homebrew/php/php71)/bin:${PATH}

export ANDROID_HOME=${HOME}/Library/Android/sdk

eval "$(pyenv init -)"

function gi() {
  curl -L -s "https://www.gitignore.io/api/$@"
}

export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
