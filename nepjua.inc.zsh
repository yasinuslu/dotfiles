alias cls="clear"

export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function gi() {
  curl -L -s "https://www.gitignore.io/api/$@"
}

export PATH=$PATH:~/bin
