df_install_docker_tools() {
  local binDir

  if [[ "${DF_PLATFORM}" -eq "Mac" ]]; then
    brew install docker-compose
  else
    binDir="${HOME}/.local/bin"
    version="1.26.2"
    curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o "${binDir}/docker-compose"
    chmod +x "${binDir}/docker-compose"
  fi
}
