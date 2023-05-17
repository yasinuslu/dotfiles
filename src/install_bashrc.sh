__df_append_line() {
  set -e

  local update line file pat lno
  update="$1"
  line="$2"
  file="$3"
  pat="${4:-}"
  lno=""

  echo "Update $file:"
  echo "  - $line"
  if [ -f "$file" ]; then
    if [ $# -lt 4 ]; then
      lno=$(\grep -nF "$line" "$file" | sed 's/:.*//' | tr '\n' ' ')
    else
      lno=$(\grep -nF "$pat" "$file" | sed 's/:.*//' | tr '\n' ' ')
    fi
  fi
  if [ -n "$lno" ]; then
    echo "    - Already exists: line #$lno"
  else
    if [ $update -eq 1 ]; then
      [ -f "$file" ] && echo -e >> "$file"
      echo -e "$line" >> "$file"
      echo "    + Added"
    else
      echo "    ~ Skipped"
    fi
  fi
  echo
  set +e
}

df_install_bashrc_append() {
  local str
  str="${@}"

  __df_append_line 1 "${str}" "${DF_BASHRC_PATH}"
}

df_install_bashrc_clean() {
  rm -f "${DF_BASHRC_PATH}"
}

df_install_bashrc() {
  mkdir -p "${DF_PROJECT_PATH}"/.gen

  # with append_line
  __df_append_line 1 ". ${DF_BASHRC_PATH}" "${HOME}"/.bashrc

  df_install_bashrc_append 'export PATH=${PATH}:/snap/bin'

  # shellcheck source=.gen/bashrc
  source "${DF_BASHRC_PATH}"
}
