df_install_binary() {
  local binDir

  binDir="${HOME}/.local/bin"

  local name=${1}
  local url=${2}

  local filePath="${binDir}/${name}"

  rm -rf "${filePath}"
  curl -L "${url}" -o "${filePath}"

  chmod +x ${filePath}
}

df_install_binaries() {
  df_install_binary "diff-so-fancy" "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"
  df_install_binary "wsl-ssh-agent-relay" "https://raw.githubusercontent.com/rupor-github/wsl-ssh-agent/master/docs/wsl-ssh-agent-relay"

  # We want this to output variable names without expanding
  # shellcheck disable=SC2016
  {
    echo -e '${HOME}/.local/bin/wsl-ssh-agent-relay start'
    echo -e 'export SSH_AUTH_SOCK=${HOME}/.ssh/wsl-ssh-agent.sock'
  } >> "${DF_BASHRC_PATH}"
}
