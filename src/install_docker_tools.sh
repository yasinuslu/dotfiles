df_install_docker_tools() {
  local binDir

  binDir="${HOME}/.local/bin"

  curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o "${binDir}/docker-compose"
  chmod +x "${binDir}/docker-compose"
}
