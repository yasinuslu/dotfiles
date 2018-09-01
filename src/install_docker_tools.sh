df_install_docker_tools() {
  sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
  sudo chmod +x /usr/bin/docker-compose
}
