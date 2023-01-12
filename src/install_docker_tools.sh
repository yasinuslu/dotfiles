df_install_docker_tools() {
  local binDir

  if [[ $DF_PLATFORM == 'Mac' ]]; then
    brew install docker-compose
  else
    binDir="${HOME}/.local/bin"
    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq '.tag_name' -r)
    curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o "${binDir}/docker-compose"
    chmod +x "${binDir}/docker-compose"
  fi
}
