df_install_git_extensions() {
  git config --global alias.ignore \
  '!gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}; gi'
}
